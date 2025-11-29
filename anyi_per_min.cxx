#include<vector>
#include<string>
#include<iostream>
#include<fstream>
#include<sstream>
#include<iomanip>

#include "TGraph.h"
#include "TDatime.h"
#include "TAxis.h"
#include "TCanvas.h"
#include "TTimeStamp.h"

using namespace std;

void read_st(string filename, std::vector<std::vector<double>> &anys, std::vector<time_t> &times) {

  const int data_max = 144000;
  int i = 0, prev_totev = -1;

  times.resize(data_max);
  std::vector<double> any1s(data_max);
  std::vector<double> any2s(data_max);
  std::vector<double> any3s(data_max);
  std::vector<double> any4s(data_max);
  std::vector<double> any2_alts(data_max);

  cout << filename << "\n";

  ifstream data(filename);
  string line;

  while (std::getline(data, line)) {
    if (line.empty()) continue;

    std::istringstream iss(line);

    string tmp, time1, time2, sqlc;
    int ns, any1, any2, any3, any4, any2_alt, tot_ev;
    int ch5644any1 = 0, ch5656any1 = 0;

    if (!(iss >> tmp >> tmp >> time1 >> time2 >> tmp)) continue;
    if (!(iss >> any1 >> any2 >> any3 >> any4 >> any2_alt)) continue;
    if (!(iss >> tot_ev >> tmp)) continue;

    if (iss >> ch5644any1 >> ch5656any1) {
      for (int k = 0; k < 6; ++k) {
        if (!(iss >> tmp)) break;
      }
    }

    if (tot_ev == 0) {
      if (prev_totev != 0) {
        i--;
        if (i < 0) i = 0;
      }
      prev_totev = tot_ev;
      continue;
    }

    if (prev_totev == 0) {
      prev_totev = tot_ev;
      continue;
    }

    prev_totev = tot_ev;

    if (i >= data_max) break;

    any1s[i] = any1;
    any2s[i] = any2;
    any3s[i] = any3;
    any4s[i] = any4;
    any2_alts[i] = any2_alt;

    sqlc = time1 + " " + time2;
    if (sqlc.size() < 6) break;

    ns = stoi(sqlc.substr(sqlc.size() - 6, 6)) * 1000;
    sqlc = sqlc.substr(0, sqlc.size() - 7);

    times[i] = TTimeStamp((time_t)TDatime(sqlc.c_str()).Convert(), ns);
    i++;
  }

  any1s.resize(i);
  any2s.resize(i);
  any3s.resize(i);
  any4s.resize(i);
  any2_alts.resize(i);
  times.resize(i);

  anys[0] = any1s;
  anys[1] = any2s;
  anys[2] = any3s;
  anys[3] = any4s;
  anys[4] = any2_alts;
}

vector<string> gen_stnames(double date) {

  vector<string> filenames;
  string base = "/disk/alpaca/data/as/stdata/";
  string suffix = ".st.d";

  TDatime ystd = TDatime(int(date - 24. * 3600.));
  TDatime today = TDatime(int(date));
  string ystd_str = ystd.AsSQLString();
  string date_str = today.AsSQLString();

  ystd_str = ystd_str.substr(2, ystd_str.size() - 11);
  date_str = date_str.substr(2, date_str.size() - 11);

  ystd_str = ystd_str.substr(0, 2) + ystd_str.substr(3, 2) + ystd_str.substr(6, 2);
  date_str = date_str.substr(0, 2) + date_str.substr(3, 2) + date_str.substr(6, 2);

  auto find_max_index = [&](const string &dstr) {
    int max_idx = 0;
    string dir = base + dstr + "/";
    for (int i = 1; i <= 99; ++i) {
      std::ostringstream oss;
      oss << setw(2) << setfill('0') << i;
      string idx = oss.str();
      string fname = dir + dstr + idx + suffix;
      ifstream f(fname.c_str());
      if (!f.good()) break;
      max_idx = i;
    }
    return max_idx;
  };

  int max_prev = find_max_index(ystd_str);
  if (max_prev > 0) {
    std::ostringstream oss;
    oss << setw(2) << setfill('0') << max_prev;
    string idx = oss.str();
    string fname = base + ystd_str + "/" + ystd_str + idx + suffix;
    filenames.push_back(fname);
  }

  int max_today = find_max_index(date_str);
  for (int i = 1; i <= max_today; ++i) {
    std::ostringstream oss;
    oss << setw(2) << setfill('0') << i;
    string idx = oss.str();
    string fname = base + date_str + "/" + date_str + idx + suffix;
    filenames.push_back(fname);
  }

  return filenames;
}

void gen_summed(double datetime, vector<string> filenames, int bin_sec, vector<double> &sp_time, vector<vector<double>> &sums) {

  sums.resize(5);
  for (int i = 0; i < 5; i++) {
    vector<double> sum(7 * 150000 / bin_sec / 10 + 10, 0);
    sums[i] = sum;
  }
  sp_time.resize(7 * 150000 / bin_sec / 10 + 10);

  time_t time_start = datetime;

  vector<double> sumi(5, 0);
  double time_diff, prev_stored = 0;
  int ind = 0, prev_i = 0;

  vector<vector<double>> anys(5);
  vector<time_t> times;

  for (auto file: filenames) {

    read_st(file.c_str(), anys, times);

    for (int i = 0; i < (int)anys[0].size(); i++) {

      if (times[i] - time_start >= bin_sec) {
        if (i > prev_i)
          time_diff = (i - prev_i) / 10.;
        else
          time_diff = (prev_stored + i - prev_i) / 10.;

        for (int j = 0; j < 5; j++) {
          sumi[j] = sumi[j] / time_diff * bin_sec;
          sums[j][ind] = sumi[j];
          sumi[j] = 0;
        }

        sp_time[ind] = times[i];
        time_start = times[i];

        prev_i = i;
        ind++;
      }

      for (int j = 0; j < 5; j++)
        sumi[j] += anys[j][i];
    }
    prev_stored = anys[0].size();
  }

  for (int i = 0; i < 5; i++) {
    sums[i].resize(ind > 0 ? ind - 1 : 0);
  }
  sp_time.resize(ind > 0 ? ind - 1 : 0);
}

void plot(int anyi, double datetime, double bin_sec, vector<double> times, vector<double> data) {

  const int colors[5] = {
    kRed, 8, kBlue, kMagenta + 1, kCyan
  };

  const double markersize[5] = {
    0.4, 0.6, 0.8, 0.8, 0.8
  };

  double init_time = datetime;
  double end_time = datetime + 24. * 3600.;

  string title = "Any " + to_string(anyi + 1) + " " + TDatime(int(init_time)).AsSQLString();
  if (anyi == 4)
    title = "Clustered Any " + to_string(2) + " " + TDatime(int(init_time)).AsSQLString();
  title = title.substr(0, title.size() - 9);
  title = title + " per " + to_string(int(bin_sec)) + " seconds";

  TGraph *gr = new TGraph(times.size(), &times[0], &data[0]);
  gr->SetMarkerStyle(21);
  gr->SetMarkerColor(colors[anyi]);
  gr->SetMarkerSize(0.4);
  gr->SetTitle(title.c_str());
  gr->GetXaxis()->SetTimeDisplay(1);
  gr->GetXaxis()->SetTimeFormat("%m/%d %H:%M:%S");
  gr->GetXaxis()->SetLabelSize(0.1);
  gr->GetXaxis()->SetNdivisions(503, true);
  gr->GetXaxis()->SetRangeUser(init_time, end_time);
  gr->GetXaxis()->SetTitle("UT");
  gr->GetXaxis()->SetTitleOffset(0.6);
  gr->GetXaxis()->SetTitleSize(0.08);
  gr->GetYaxis()->SetLabelSize(0.1);
  gr->GetYaxis()->SetTitle(("Counts per " + to_string(int(bin_sec)) + " s").c_str());
  gr->GetYaxis()->SetTitleSize(0.08);
  gr->GetYaxis()->SetTitleOffset(0.5);
  gr->Draw("AP");
}

void anyi_per_min(double bin_sec, string date) {

  string mod_date = "20" + date + " 00:00:00";
  string dir_date = date.substr(0, 2) + date.substr(3, 2) + date.substr(6, 2);
  double init_time = TDatime(mod_date.c_str()).Convert();

  vector<vector<double>> summed(5);
  vector<double> bin_time;
  vector<string> filenames = gen_stnames(init_time);

  string output_fn = "anyi_" + dir_date + "_" + to_string(int(bin_sec)) + ".png";
  output_fn = "/home/sanchu/monitor///count_pdf/" + dir_date + "/" + output_fn;

  gen_summed(init_time, filenames, bin_sec, bin_time, summed);

  TCanvas *c = new TCanvas("c1", "Value vs Time Plot", 1600, 1400);
  c->Divide(1, 5);
  gStyle->SetTitleFontSize(0.09);
  for (int i = 0; i < 5; i++) {
    c->cd(i + 1);
    plot(i, init_time, bin_sec, bin_time, summed[i]);
  }

  c->Modified();
  c->Update();
  c->SaveAs(output_fn.c_str());
}

