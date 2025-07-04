set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_9.pdf"

set key top below
set xlabel "Local time()"
set ylabel "# of count"
#set xlabel font "Helvetica, 30" 
#set ylabel font "Helvetica, 30" 
set yrange [25000:75000]
set xdata time
set timefmt "%Y/%m/%d-%H:%M:%S"
set xrange [] 

plot\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5458) print $2,($4),sqrt($4)}'" using 1:2:3 title '5458' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5460) print $2,($4),sqrt($4)}'" using 1:2 title '5460' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5642) print $2,($4),sqrt($4)}'" using 1:2 title '5642' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5644) print $2,($4),sqrt($4)}'" using 1:2 title '5644' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5646) print $2,($4),sqrt($4)}'" using 1:2 title '5646' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5648) print $2,($4),sqrt($4)}'" using 1:2 title '5648' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5650) print $2,($4),sqrt($4)}'" using 1:2 title '5650' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5652) print $2,($4),sqrt($4)}'" using 1:2 title '5652' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5654) print $2,($4),sqrt($4)}'" using 1:2 title '5654' with line lc 8,\

unset output

set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_9.png"
set key top below
set xlabel "Local time()"
set ylabel "# of count"
#set xlabel font "Helvetica, 30"
#set ylabel font "Helvetica, 30"
set yrange [25000:75000]
set xdata time
set timefmt "%Y/%m/%d-%H:%M:%S"
set xrange []

plot\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5458) print $2,($4),sqrt($4)}'" using 1:2:3 title '54\
58' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5460) print $2,($4),sqrt($4)}'" using 1:2 title '5460\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5642) print $2,($4),sqrt($4)}'" using 1:2 title '5642\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5644) print $2,($4),sqrt($4)}'" using 1:2 title '5644\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5646) print $2,($4),sqrt($4)}'" using 1:2 title '5646\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5648) print $2,($4),sqrt($4)}'" using 1:2 title '5648\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5650) print $2,($4),sqrt($4)}'" using 1:2 title '5650\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5652) print $2,($4),sqrt($4)}'" using 1:2 title '5652\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5654) print $2,($4),sqrt($4)}'" using 1:2 title '5654\
' with line lc 8,\


unset output
