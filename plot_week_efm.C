#include <iostream>
#include <fstream>
#include <string>
#include <ctime>
#include <cstdlib>

void plot_week_efm() {
    time_t now = time(0) - 86400;
    const int day_num = 7;

    struct tm tm_now = *localtime(&now);
    char date_str[7];
    strftime(date_str, sizeof(date_str), "%y%m%d", &tm_now);
    std::string prev_date(date_str);

    std::string out_dir = "/home/sanchu/monitor/count_week/" + prev_date + "/";
    std::string efm_week_txt = out_dir + "efm_week.txt";

    std::string mkdir_cmd = "mkdir -p " + out_dir;
    system(mkdir_cmd.c_str());

    std::ofstream efm_out(efm_week_txt);
    if (!efm_out.is_open()) {
        std::cerr << "Failed to open " << efm_week_txt << std::endl;
        return;
    }

    for (int i = day_num - 1; i >= 0; i--) {
        time_t day_time = now - i * 86400;
        struct tm tm_day = *localtime(&day_time);

        char day_str[7];
        strftime(day_str, sizeof(day_str), "%y%m%d", &tm_day);
        std::string day_date(day_str);

        std::string efm_file = "/path/to/efm_data/efm_" + day_date + ".txt";

        std::ifstream efm_in(efm_file);
        if (efm_in.is_open()) {
            std::string line;
            while (std::getline(efm_in, line)) {
                efm_out << line << std::endl;
            }
            efm_in.close();
        } else {
            std::cerr << "Cannot open " << efm_file << std::endl;
        }
    }
    efm_out.close();
}

