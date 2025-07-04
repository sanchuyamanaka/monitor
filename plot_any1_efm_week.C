#include <iostream>
#include <fstream>
#include <string>
#include <ctime>
#include <cstdlib>

void plot_any1_efm_week() {

    time_t now = time(0) - 86400;
    struct tm tm_now = *localtime(&now);
    char date_str[7];
    strftime(date_str, sizeof(date_str), "%y%m%d", &tm_now);
    std::string prev_date(date_str);

    const int day_num = 7;
    time_t t = now;
    struct tm tm_day;
    char day_str[7];
    
    std::string out_dir = "/home/sanchu/monitor/count_week/" + prev_date + "/";
    std::string any1_week_txt = out_dir + "any1_week.txt";

    std::string mkdir_cmd = "mkdir -p " + out_dir;
    system(mkdir_cmd.c_str());

    std::ofstream any1_out(any1_week_txt);
    if(!any1_out.is_open()){
        std::cerr << "Failed to open " << any1_week_txt << std::endl;
        return;
    }

    for(int i=day_num-1; i>=0; i--){
        t = now - i*86400;
        tm_day = *localtime(&t);
        strftime(day_str, sizeof(day_str), "%y%m%d", &tm_day);
        std::string day_date(day_str);

        std::string cmd = "cat /disk/alpaca/data/as/stdata/" + day_date + "/" + day_date + "*.d | awk '{print $3,$4,$6,sqrt($6)}'";
        std::string tmp_file = "/tmp/any1_tmp.txt";
        std::string full_cmd = cmd + " > " + tmp_file;
        system(full_cmd.c_str());

        std::ifstream tmp_in(tmp_file);
        if(tmp_in.is_open()){
            std::string line;
            while(std::getline(tmp_in, line)){
                any1_out << line << std::endl;
            }
            tmp_in.close();
        } else {
            std::cerr << "Failed to open tmp file " << tmp_file << std::endl;
        }
    }
    any1_out.close();

}

