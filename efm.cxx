{

  double unix_time, ev;
  int ind = 0;
  file = "tmp_efm.txt";

  ifstream data;

  double timearr[200000000];
  double volt[200000000];
  
  //後でタイトルに日付いれるようにする
  string date;

  data.open(file);
  while (!data.eof()){
    data >> timearr[ind] >> volt[ind];
    ind++;
  }

  string td = TDatime(timearr[0]).AsSQLString();
  string title = td.substr(0, 10);
  
  cout << td << "\n";

  TGraph *gr = new TGraph(ind - 1, timearr, volt);
  TCanvas *c = new TCanvas("c1", "Value vs Time Plot", 200, 10, 700, 500);
  
  gr->Draw("APL");

  gr->GetXaxis()->SetTimeDisplay(1);
  gr->GetXaxis()->SetTimeFormat("%m/%d %H:%M:%S");
  gr->GetXaxis()->SetNdivisions(705, true);
  gr->GetXaxis()->SetTitle("UT");
  gr->GetYaxis()->SetTitle("Electric Field [kV/m]");
  
  gr->SetTitle(("Electric Field over time " + title).c_str());
  
  c->Modified();
  c->Update();
    
	c->SaveAs("/home/sanchu/monitor///count_pdf/xxxx/xxxx_efm.png");
  
}
