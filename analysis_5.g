set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_5.pdf"

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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4848) print $2,($4),sqrt($4)}'" using 1:2:3 title '4848' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4850) print $2,($4),sqrt($4)}'" using 1:2 title '4850' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4852) print $2,($4),sqrt($4)}'" using 1:2 title '4852' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4854) print $2,($4),sqrt($4)}'" using 1:2 title '4854' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4856) print $2,($4),sqrt($4)}'" using 1:2 title '4856' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4858) print $2,($4),sqrt($4)}'" using 1:2 title '4858' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4860) print $2,($4),sqrt($4)}'" using 1:2 title '4860' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5042) print $2,($4),sqrt($4)}'" using 1:2 title '5042' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5044) print $2,($4),sqrt($4)}'" using 1:2 title '5044' with line lc 8,\

unset output        

set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_5.png"
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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4848) print $2,($4),sqrt($4)}'" using 1:2:3 title '48\
48' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4850) print $2,($4),sqrt($4)}'" using 1:2 title '4850\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4852) print $2,($4),sqrt($4)}'" using 1:2 title '4852\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4854) print $2,($4),sqrt($4)}'" using 1:2 title '4854\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4856) print $2,($4),sqrt($4)}'" using 1:2 title '4856\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4858) print $2,($4),sqrt($4)}'" using 1:2 title '4858\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4860) print $2,($4),sqrt($4)}'" using 1:2 title '4860\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5042) print $2,($4),sqrt($4)}'" using 1:2 title '5042\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5044) print $2,($4),sqrt($4)}'" using 1:2 title '5044\
' with line lc 8,\

unset output
