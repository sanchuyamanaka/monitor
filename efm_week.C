#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <ctime>
#include <cstdlib>

struct DataPoint {
    double time;
    double value;
};

void CalculateEfmForDate(const std::string& date_str) {
    std::string cmd = "root -l -b -q 'efm.cxx(\"" + date_str + "\")'";
    std::cout << "Executing: " << cmd << std::endl;
    system(cmd.c_str());
}

std::vector<DataPoint> ReadTmpEfmTxt() {
    std::ifstream data("tmp_efm.txt");
    std::vector<DataPoint> result;
    double t, v;
    while (data >> t >> v) {
        result.push_back({t, v});
    }
    return result;
}

void SaveEfmWeekTxt(const std::vector<DataPoint>& all_data, const std::string& outpath) {
    std::ofstream ofs(outpath);
    for (const auto& dp : all_data) {
        ofs << dp.time << " " << dp.value << "\n";
    }
}

std::string GetDateStr(time_t t) {
    struct tm tm_time = *localtime(&t);
    char buf[7];
    strftime(buf, sizeof(buf), "%y%m%d", &tm_time);
    return std::string(buf);
}

std::string GetDirName(time_t t) {
    struct tm tm_time = *localtime(&t);
    char buf[9];
    strftime(buf, sizeof(buf), "%Y%m%d", &tm_time);
    return std::string(buf);
}

int main() {
    time_t now = time(nullptr);
    time_t base_day = now - 86400;

    int days = 7;

    std::string out_dir = "/home/sanchu/monitor/count_week/" + GetDirName(base_day) + "/";
    system(("mkdir -p " + out_dir).c_str());

    std::vector<DataPoint> all_data;

    for (int i = days - 1; i >= 0; --i) {
        time_t day = base_day - i * 86400;
        std::string date_str = GetDateStr(day);

        CalculateEfmForDate(date_str);

        std::vector<DataPoint> day_data = ReadTmpEfmTxt();

        all_data.insert(all_data.end(), day_data.begin(), day_data.end());
    }

    SaveEfmWeekTxt(all_data, out_dir + "efm_week.txt");

    std::cout << "Saved 1 week of EFM data to " << out_dir << "efm_week.txt" << std::endl;

    return 0;
}

