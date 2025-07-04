#include <TSystem.h>
#include <TDatime.h>
#include <TString.h>
#include <iostream>
#include <fstream>
#include <sstream>

using namespace std;

int main() {
  TDatime today;
  today.Set();

  const int nDays = 7;


  TDatime yesterday(today.GetYear(), today.GetMonth(), today.GetDay() - 1, 0, 0, 0);
  TString dir_tag = Form("%02d%02d%02d", yesterday.GetYear() % 100, yesterday.GetMonth(), yesterday.GetDay());
  TString save_dir = "/home/sanchu/monitor/count_week/" + dir_tag;

  gSystem->mkdir(save_dir, true);
  TString week_file = save_dir + "/efm_week.txt";

  ofstream efm_out(week_file.Data(), ios::out);
  if (!efm_out.is_open()) {
    cout << "Failed to open output file: " << week_file << endl;
    return 1;
  }

  for (int i = 0; i < nDays; ++i) {
    TDatime day(today.GetYear(), today.GetMonth(), today.GetDay() - 1 - i, 0, 0, 0);
    TString tag = Form("%02d%02d%02d", day.GetYear() % 100, day.GetMonth(), day.GetDay());

    TString cmd = Form("export EFM_DATE=%s && root -l -q /home/sanchu/monitor/efm.cxx", tag.Data());
    int ret = gSystem->Exec(cmd);
    if (ret != 0) {
      cout << "Failed to execute efm.cxx for " << tag << endl;
      continue;
    }

    ifstream tmp("tmp_efm.txt");
    if (!tmp.is_open()) {
      cout << "Cannot open tmp_efm.txt for " << tag << endl;
      continue;
    }

    string line;
    while (getline(tmp, line)) {
      efm_out << line << endl;
    }
    tmp.close();
  }

  efm_out.close();
  cout << "Saved 7-day efm data to: " << week_file << endl;
  return 0;
}
