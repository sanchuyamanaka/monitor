set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_6.pdf"

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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5046) print $2,($4),sqrt($4)}'" using 1:2:3 title '5046' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5048) print $2,($4),sqrt($4)}'" using 1:2 title '5048' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5050) print $2,($4),sqrt($4)}'" using 1:2 title '5050' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5052) print $2,($4),sqrt($4)}'" using 1:2 title '5052' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5054) print $2,($4),sqrt($4)}'" using 1:2 title '5054' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5056) print $2,($4),sqrt($4)}'" using 1:2 title '5056' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5058) print $2,($4),sqrt($4)}'" using 1:2 title '5058' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5240) print $2,($4),sqrt($4)}'" using 1:2 title '5240' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5242) print $2,($4),sqrt($4)}'" using 1:2 title '5242' with line lc 8,\
        
unset output
        
set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_6.png"
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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5046) print $2,($4),sqrt($4)}'" using 1:2:3 title '50\
46' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5048) print $2,($4),sqrt($4)}'" using 1:2 title '5048\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5050) print $2,($4),sqrt($4)}'" using 1:2 title '5050\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5052) print $2,($4),sqrt($4)}'" using 1:2 title '5052\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5054) print $2,($4),sqrt($4)}'" using 1:2 title '5054\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5056) print $2,($4),sqrt($4)}'" using 1:2 title '5056\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5058) print $2,($4),sqrt($4)}'" using 1:2 title '5058\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5240) print $2,($4),sqrt($4)}'" using 1:2 title '5240\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5242) print $2,($4),sqrt($4)}'" using 1:2 title '5242\
' with line lc 8,\

unset output
