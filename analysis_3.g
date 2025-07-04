set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_3.pdf"
#set title "検出器＿の１日のカウント数"

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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4454) print $2,($4),sqrt($4)}'" using 1:2:3 title '4454' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4456) print $2,($4),sqrt($4)}'" using 1:2 title '4452' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4458) print $2,($4),sqrt($4)}'" using 1:2 title '4458' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4640) print $2,($4),sqrt($4)}'" using 1:2 title '4640' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4642) print $2,($4),sqrt($4)}'" using 1:2 title '4642' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4644) print $2,($4),sqrt($4)}'" using 1:2 title '4644' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4646) print $2,($4),sqrt($4)}'" using 1:2 title '4646' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4648) print $2,($4),sqrt($4)}'" using 1:2 title '4648' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4650) print $2,($4),sqrt($4)}'" using 1:2 title '4650' with line lc 8,\

unset output   

set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_3.png"
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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4454) print $2,($4),sqrt($4)}'" using 1:2:3 title '44\
54' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4456) print $2,($4),sqrt($4)}'" using 1:2 title '4452\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4458) print $2,($4),sqrt($4)}'" using 1:2 title '4458\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4640) print $2,($4),sqrt($4)}'" using 1:2 title '4640\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4642) print $2,($4),sqrt($4)}'" using 1:2 title '4642\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4644) print $2,($4),sqrt($4)}'" using 1:2 title '4644\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4646) print $2,($4),sqrt($4)}'" using 1:2 title '4646\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4648) print $2,($4),sqrt($4)}'" using 1:2 title '4648\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4650) print $2,($4),sqrt($4)}'" using 1:2 title '4650\
' with line lc 8,\

unset output
