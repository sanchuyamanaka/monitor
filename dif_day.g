set terminal pngcairo size 1536,864
set output "/home/sanchu/monitor///count_pdf/xxxx/xxxx_dif_day.png"

set xlabel "day(Max-min)"
set ylabel "# of detectors"
min=0
max=10000
n=50
width = (max- min)/n
bin(x) = width*(floor((x - min)/width)+0.5) + min

plot "<cat ./count/xxxx/dif_day"  using (bin($1)):(1.0) smooth frequency with boxes

unset output
