set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_1.pdf"

c_min=25000
c_max=75000

set key top below
set xlabel "Local time()"
set ylabel "# of count"
#set xlabel font "Helvetica, 30" 
#set ylabel font "Helvetica, 30" 
set yrange [25000:750000]
set xdata time
set timefmt "%Y/%m/%d-%H:%M:%S"
set xrange [] 


plot\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4046) print $2,($4),sqrt($4)}'" using 1:2:3 title '4046' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4048) print $2,($4),sqrt($4)}'" using 1:2 title '4048' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4050) print $2,($4),sqrt($4)}'" using 1:2 title '4050' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4052) print $2,($4),sqrt($4)}'" using 1:2 title '4052' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4054) print $2,($4),sqrt($4)}'" using 1:2 title '4052' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4244) print $2,($4),sqrt($4)}'" using 1:2 title '4244' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4246) print $2,($4),sqrt($4)}'" using 1:2 title '4246' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4248) print $2,($4),sqrt($4)}'" using 1:2 title '4248' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4250) print $2,($4),sqrt($4)}'" using 1:2 title '4250' with line lc 8,\

unset output     
        
set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_1.png"

set key top below
set xlabel "Local time()"
set ylabel "# of count"
#set xlabel font "Helvetica, 30"
#set ylabel font "Helvetica, 30"
set yrange [c_min:c_max]
set xdata time
set timefmt "%Y/%m/%d-%H:%M:%S"
set xrange []


plot\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4046) print $2,($4),sqrt($4)}'" using 1:2:3 title '40\
46' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4048) print $2,($4),sqrt($4)}'" using 1:2 title '4048\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4050) print $2,($4),sqrt($4)}'" using 1:2 title '4050\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4052) print $2,($4),sqrt($4)}'" using 1:2 title '4052\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4054) print $2,($4),sqrt($4)}'" using 1:2 title '4052\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4244) print $2,($4),sqrt($4)}'" using 1:2 title '4244\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4246) print $2,($4),sqrt($4)}'" using 1:2 title '4246\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4248) print $2,($4),sqrt($4)}'" using 1:2 title '4248\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4250) print $2,($4),sqrt($4)}'" using 1:2 title '4250\
' with line lc 8,\

unset output
