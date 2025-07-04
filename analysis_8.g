set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_8.pdf"

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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5440) print $2,($4),sqrt($4)}'" using 1:2:3 title '5440' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5442) print $2,($4),sqrt($4)}'" using 1:2 title '5442' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5444) print $2,($4),sqrt($4)}'" using 1:2 title '5444' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5446) print $2,($4),sqrt($4)}'" using 1:2 title '5446' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5448) print $2,($4),sqrt($4)}'" using 1:2 title '5448' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5450) print $2,($4),sqrt($4)}'" using 1:2 title '5450' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5452) print $2,($4),sqrt($4)}'" using 1:2 title '5452' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5454) print $2,($4),sqrt($4)}'" using 1:2 title '5454' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5456) print $2,($4),sqrt($4)}'" using 1:2 title '5456' with line lc 8,\
        
unset output

set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_8.png"
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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5440) print $2,($4),sqrt($4)}'" using 1:2:3 title '54\
40' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5442) print $2,($4),sqrt($4)}'" using 1:2 title '5442\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5444) print $2,($4),sqrt($4)}'" using 1:2 title '5444\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5446) print $2,($4),sqrt($4)}'" using 1:2 title '5446\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5448) print $2,($4),sqrt($4)}'" using 1:2 title '5448\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5450) print $2,($4),sqrt($4)}'" using 1:2 title '5450\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5452) print $2,($4),sqrt($4)}'" using 1:2 title '5452\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5454) print $2,($4),sqrt($4)}'" using 1:2 title '5454\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==5456) print $2,($4),sqrt($4)}'" using 1:2 title '5456\
' with line lc 8,\

unset output
