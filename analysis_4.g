set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_4.pdf"

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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4652) print $2,($4),sqrt($4)}'" using 1:2:3 title '4652' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4654) print $2,($4),sqrt($4)}'" using 1:2 title '4654' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4656) print $2,($4),sqrt($4)}'" using 1:2 title '4656' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4658) print $2,($4),sqrt($4)}'" using 1:2 title '4658' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4660) print $2,($4),sqrt($4)}'" using 1:2 title '4660' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4840) print $2,($4),sqrt($4)}'" using 1:2 title '4840' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4842) print $2,($4),sqrt($4)}'" using 1:2 title '4842' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4844) print $2,($4),sqrt($4)}'" using 1:2 title '4844' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4846) print $2,($4),sqrt($4)}'" using 1:2 title '4846' with line lc 8,\
        
unset output

set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_4.png"
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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4652) print $2,($4),sqrt($4)}'" using 1:2:3 title '46\
52' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4654) print $2,($4),sqrt($4)}'" using 1:2 title '4654\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4656) print $2,($4),sqrt($4)}'" using 1:2 title '4656\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4658) print $2,($4),sqrt($4)}'" using 1:2 title '4658\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4660) print $2,($4),sqrt($4)}'" using 1:2 title '4660\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4840) print $2,($4),sqrt($4)}'" using 1:2 title '4840\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4842) print $2,($4),sqrt($4)}'" using 1:2 title '4842\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4844) print $2,($4),sqrt($4)}'" using 1:2 title '4844\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4846) print $2,($4),sqrt($4)}'" using 1:2 title '4846\
' with line lc 8,\

unset output
