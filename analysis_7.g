set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_7.pdf"

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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5244) print $2,($4),sqrt($4)}'" using 1:2:3 title '5244' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5246) print $2,($4),sqrt($4)}'" using 1:2 title '5246' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5248) print $2,($4),sqrt($4)}'" using 1:2 title '5248' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5250) print $2,($4),sqrt($4)}'" using 1:2 title '5250' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5252) print $2,($4),sqrt($4)}'" using 1:2 title '5252' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5254) print $2,($4),sqrt($4)}'" using 1:2 title '5254' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5256) print $2,($4),sqrt($4)}'" using 1:2 title '5256' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5258) print $2,($4),sqrt($4)}'" using 1:2 title '5258' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5260) print $2,($4),sqrt($4)}'" using 1:2 title '5260' with line lc 8,\
        
unset output

set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_7.png"
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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5244) print $2,($4),sqrt($4)}'" using 1:2:3 title '52\
44' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5246) print $2,($4),sqrt($4)}'" using 1:2 title '5246\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5248) print $2,($4),sqrt($4)}'" using 1:2 title '5248\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5250) print $2,($4),sqrt($4)}'" using 1:2 title '5250\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5252) print $2,($4),sqrt($4)}'" using 1:2 title '5252\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5254) print $2,($4),sqrt($4)}'" using 1:2 title '5254\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5256) print $2,($4),sqrt($4)}'" using 1:2 title '5256\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5258) print $2,($4),sqrt($4)}'" using 1:2 title '5258\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5260) print $2,($4),sqrt($4)}'" using 1:2 title '5260\
' with line lc 8,\

unset output
