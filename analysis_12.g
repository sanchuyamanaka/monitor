set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_12.pdf"

set key top
set xlabel "Local time()"
set ylabel "# of count"
set yrange [25000:75000]
set xdata time
set timefmt "%Y/%m/%d-%H:%M:%S"
set xrange []

plot\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5042) print $2,($4),sqrt($4)}'" using 1:2:3 title '5042' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5240) print $2,($4),sqrt($4)}'" using 1:2 title '5240' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5258) print $2,($4),sqrt($4)}'" using 1:2 title '5258' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5442) print $2,($4),sqrt($4)}'" using 1:2 title '5442' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5642) print $2,($4),sqrt($4)}'" using 1:2 title '5642' with line lc 4,\

unset output

set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_12.png"
set key top
set xlabel "Local time()"
set ylabel "# of count"
set yrange [25000:75000]
set xdata time
set timefmt "%Y/%m/%d-%H:%M:%S"
set xrange []

plot\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5042) print $2,($4),sqrt($4)}'" using 1:2:3 title '5042' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5240) print $2,($4),sqrt($4)}'" using 1:2 title '5240' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5258) print $2,($4),sqrt($4)}'" using 1:2 title '5258' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5442) print $2,($4),sqrt($4)}'" using 1:2 title '5442' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5642) print $2,($4),sqrt($4)}'" using 1:2 title '5642' with line lc 4,\

unset output

