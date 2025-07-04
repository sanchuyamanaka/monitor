set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_11.pdf"

set key top below
set xlabel "time()"
set ylabel "# of count"
#set xlabel font "Helvetica, 30"
#set ylabel font "Helvetica, 30"
set yrange [25000:75000]
set xdata time
set timefmt "%Y/%m/%d-%H:%M:%S"
set xrange []

plot\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6046) print $2,($4),sqrt($4)}'" using 1:2:3 title '6046' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6048) print $2,($4),sqrt($4)}'" using 1:2 title '6048' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6050) print $2,($4),sqrt($4)}'" using 1:2 title '6050' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6052) print $2,($4),sqrt($4)}'" using 1:2 title '6052' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6054) print $2,($4),sqrt($4)}'" using 1:2 title '6054' with line lc 4,\
#"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5850) print $2,($4),sqrt($4)}'" using 1:2 title '5850' with line lc 5,\
#"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5852) print $2,($4),sqrt($4)}'" using 1:2 title '5852' with line lc 6,\
#"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5854) print $2,($4),sqrt($4)}'" using 1:2 title '5854' with line lc 7,\
#"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5856) print $2,($4),sqrt($4)}'" using 1:2 title '5856' with line lc 8,\

unset output

set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_11.png"
set key top below
set xlabel "time()"
set ylabel "# of count"
#set xlabel font "Helvetica, 30"
#set ylabel font "Helvetica, 30"
set yrange [25000:75000]
set xdata time
set timefmt "%Y/%m/%d-%H:%M:%S"
set xrange []

plot\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6046) print $2,($4),sqrt($4)}'" using 1:2:3 title '60\
46' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6048) print $2,($4),sqrt($4)}'" using 1:2 title '6048\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6050) print $2,($4),sqrt($4)}'" using 1:2 title '6050\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6052) print $2,($4),sqrt($4)}'" using 1:2 title '6052\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==6054) print $2,($4),sqrt($4)}'" using 1:2 title '6054\
' with line lc 4,\
#"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5850) print $2,($4),sqrt($4)}'" using 1:2 title '585\
0' with line lc 5,\
#"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5852) print $2,($4),sqrt($4)}'" using 1:2 title '585\
2' with line lc 6,\
#"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5854) print $2,($4),sqrt($4)}'" using 1:2 title '585\
4' with line lc 7,\
#"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5856) print $2,($4),sqrt($4)}'" using 1:2 title '585\
6' with line lc 8,\

unset output
