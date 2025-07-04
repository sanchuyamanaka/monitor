set terminal pdf
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_2.pdf"

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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4252) print $2,($4),sqrt($4)}'" using 1:2:3 title '4252' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4254) print $2,($4),sqrt($4)}'" using 1:2 title '4254' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4256) print $2,($4),sqrt($4)}'" using 1:2 title '4256' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4442) print $2,($4),sqrt($4)}'" using 1:2 title '4442' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4444) print $2,($4),sqrt($4)}'" using 1:2 title '4444' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4446) print $2,($4),sqrt($4)}'" using 1:2 title '4446' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4448) print $2,($4),sqrt($4)}'" using 1:2 title '4448' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4450) print $2,($4),sqrt($4)}'" using 1:2 title '4450' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4452) print $2,($4),sqrt($4)}'" using 1:2 title '4452\
' with line lc 8,\

unset output
        
set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_2.png"
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
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4252) print $2,($4),sqrt($4)}'" using 1:2:3 title '42\
52' with yerrorbars,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4254) print $2,($4),sqrt($4)}'" using 1:2 title '4254\
' with line lc 1,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4256) print $2,($4),sqrt($4)}'" using 1:2 title '4256\
' with line lc 2,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4442) print $2,($4),sqrt($4)}'" using 1:2 title '4442\
' with line lc 3,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4444) print $2,($4),sqrt($4)}'" using 1:2 title '4444\
' with line lc 4,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4446) print $2,($4),sqrt($4)}'" using 1:2 title '4446\
' with line lc 5,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4448) print $2,($4),sqrt($4)}'" using 1:2 title '4448\
' with line lc 6,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4450) print $2,($4),sqrt($4)}'" using 1:2 title '4450\
' with line lc 7,\
"<cat ./count/xxxx/count_xxxx*.dat | awk '{if($3==4452) print $2,($4),sqrt($4)}'" using 1:2 title '4452\
\
' with line lc 8,\

unset output
