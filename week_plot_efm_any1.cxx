{
  gROOT->SetBatch(); 
  gStyle->SetTimeOffset(0);
  const int days = 7;
  time_t now = time(0);
  now -= 86400; 
  char cmd[256];
  char date_str[16];
  char ymd[32];

 
  strftime(ymd, sizeof(ymd), "/home/sanchu/monitor/count_week/%Y%m%d", localtime(&now));
  sprintf(cmd, "mkdir -p %s", ymd);
  system(cmd);

  std::vector<double> time_efm, val_efm;
  std::vector<double> time_any, val_any;

  for (int i = 0; i < days; i++) {
    time_t t = now - i * 86400;
    strftime(date_str, sizeof(date_str), "%Y%m%d", localtime(&t));
    
   
    sprintf(cmd, "python /home/sanchu/monitor/readEFM.py /disk/alpaca/data/em/EFM100/data/%s.dat >> %s/efm.txt", date_str, ymd);
    system(cmd);
    
    
    sprintf(cmd, "cat /home/sanchu/monitor/count/%s/any1 | awk '{print $1, $2}' >> %s/any1.txt", date_str, ymd);
    system(cmd);
  }





  FILE *fp = fopen((std::string(ymd) + "/efm.txt").c_str(), "r");
  double t1, v1;
  while (fscanf(fp, "%lf %lf", &t1, &v1) == 2) {
    time_efm.push_back(t1);
    val_efm.push_back(v1);
  }
  fclose(fp);

  fp = fopen((std::string(ymd) + "/any1.txt").c_str(), "r");
  while (fscanf(fp, "%lf %lf", &t1, &v1) == 2) {
    time_any.push_back(t1);
    val_any.push_back(v1);
  }
  fclose(fp);




  TCanvas *c = new TCanvas("c", "EFM and ANY1", 1000, 700);
  c->Divide(1, 2);




  c->cd(1);
  TGraph *g1 = new TGraph(time_any.size(), &time_any[0], &val_any[0]);
  g1->SetTitle("ANY1");
  g1->GetXaxis()->SetTimeDisplay(1);
  g1->GetXaxis()->SetTimeFormat("%m/%d %H:%M");
  g1->GetXaxis()->SetTitle("Date");
  g1->GetYaxis()->SetTitle("ANY1");
  g1->Draw("APL");



  
  c->cd(2);
  TGraph *g2 = new TGraph(time_efm.size(), &time_efm[0], &val_efm[0]);
  g2->SetTitle("Electric Field (EFM)");
  g2->GetXaxis()->SetTimeDisplay(1);
  g2->GetXaxis()->SetTimeFormat("%m/%d %H:%M");
  g2->GetXaxis()->SetTitle("Date");
  g2->GetYaxis()->SetTitle("Electric Field [kV/m]");
  g2->Draw("APL");

  c->SaveAs((std::string(ymd) + "/efm_any1_week.png").c_str());

  std::cout << "Saved: " << ymd << "/efm_any1_week.png" << std::endl;
}
