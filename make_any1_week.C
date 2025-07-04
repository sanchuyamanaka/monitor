void make_any1_week() {


  gROOT->SetBatch();

  std::string base_dir = "/home/sanchu/monitor/count_week/";

  time_t now = time(0) - 86400;
  struct tm tm_now = *localtime(&now);

  char date_str[16];
  strftime(date_str, sizeof(date_str), "%Y%m%d", &tm_now);
  std::string work_dir = base_dir + std::string(date_str);

  std::string mkdir_cmd = "mkdir -p " + work_dir;
  system(mkdir_cmd.c_str());

  std::string any1_week_file = work_dir + "/any1_week.txt";

  std::string cat_files = "";
  for (int i = 0; i < 7; i++) {
    time_t target_time = now - 86400 * i;
    struct tm tm_target = *localtime(&target_time);
    char file_date[16];
    strftime(file_date, sizeof(file_date), "%Y%m%d", &tm_target);

    std::string file_pattern = "/disk/alpaca/data/as/stdata/xxxx/xxxx" + std::string(file_date) + ".d";

    cat_files += file_pattern + " ";
  }

  std::string cmd = "cat " + cat_files + " | awk '{print $3, $4, $6}' > " + any1_week_file;
  int ret = system(cmd.c_str());
  if (ret != 0) {
    std::cerr << "Error: any1_week.txt" << std::endl;
    return;
  }

  std::cout << "any1_week.txt : " << any1_week_file << std::endl;







}
