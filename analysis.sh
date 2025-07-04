#!/bin/sh
ROOTSYS=/usr/local/gcc485/ROOT/6.08.06
PATH=$ROOTSYS/bin:$HOME/bin:$PATH:/usr/local/gcc485/ROOT/6.08.06/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/gcc485/ROOT/6.08.06/bin
LD_LIBRARY_PATH=$ROOTSYS/lib/root:$LD_LIBRARY_PATH

export PATH
export LD_LIBRARY_PATH

data_dir=/disk/alpaca/data/as/rawdata
count_dir=/home/sanchu/monitor///count
ana_alpaca=/home/sanchu/monitor//

if [ $# -eq 0 ]
then
  date_dir=`ls $data_dir | tail -2 | head -1`
  previous_day=`ls $data_dir | tail -3 | head -1`
  next_day=`ls $data_dir | tail -1 | head -1`
  yesterday=$(date -d " -1 day" "+%Y%m%d")
  yyesterday=$(date -d " -2 day" "+%Y%m%d")
  yesterday_hyp=$(date -d " -1 day" "+%y-%m-%d")
else
  date_dir=`date -d $1 +%y%m%d`
  previous_day=`date -d $1" -1 day" +%y%m%d`
  next_day=`date -d $1" +1 day" +%y%m%d`
  yesterday=$(date -d $1 "+%Y%m%d")
  yyesterday=$(date -d $1" -1 day" "+%Y%m%d")
  yesterday_hyp=$(date -d $1 "+%y-%m-%d")
fi


echo $date_dir
cd $ana_alpaca

mkdir -p count/$date_dir

for file in `ls $data_dir/$date_dir`
do
    echo $data_dir/$date_dir/$file
    bzcat $data_dir/$date_dir/$file | $ana_alpaca/dread_alpaca_count > $count_dir/$date_dir/count_$file.dat
done 

mkdir -p $ana_alpaca/count_pdf/$date_dir

for i in `seq 1 11`
do
    echo $ana_alpaca/analysis_$i
    cat analysis_$i.g | sed 's/xxxx/'"$date_dir"'/g'>tmp.g
    gnuplot tmp.g
done

for j in `seq 1 4`
do
    echo $ana_alpaca/any$j
    cat any$j | sed 's/xxxx/'"$date_dir"'/g'>tmp.g
    gnuplot tmp.g
done

echo $ana_alpaca/any2cluster
cat any2cluster | sed 's/xxxx/'"$date_dir"'/g'>tmp.g
gnuplot tmp.g

cd $count_dir/$date_dir
CH=4046
file=`ls | head -1`
for CH in `cat $file | awk 'NR>=2 && $3>0 {print $3}'`

do
    cat *.dat | awk 'BEGIN { max=0; min=1000000000000000; }

{if($3=='$CH'){
    if ($4 > max) max = $4  # 最大値を更新
    if ($4 < min) min = $4  # 最小値を更新

}
}
END{
    diff = max - min
    max = max
    min = min

    if(diff>5000) print "Light Leakage"
    if(diff>5000) print '$CH', diff
    if(min<1000) print "Too law count"
    if(min<1000) print '$CH', min
    if(max>80000) print "Too hight count"
    if(max>80000) print '$CH', max
}
'
done > tmp_alert

#5000以上の開きがあるCHを出力

#以下min vs max scatter plot
for CH in `cat $file | awk 'NR>=2 && $3>0 {print $3}'`

do
    cat *.dat | awk 'BEGIN { max=0; min=1000000000000000; }

{if($3=='$CH'){
   if ($4 > max) max = $4  # 最大値を更新
    if ($4 < min) min = $4  # 最小値を更新
}
}

END {
    min = min
    max = max
    print '$CH', min, max
 
}'

done > min_max_scatter

#以下ヒストグラム用
for CH in `cat $file | awk 'NR>=2 && $3>0 {print $3}'`

do
    cat *.dat | awk 'BEGIN { max=0; min=1000000000000000; }

{if($3=='$CH'){
   if ($4 > max) max = $4  # 最大値を更新
    if ($4 < min) min = $4  # 最小値を更新
}
}

END {
    diff = max - min
    print diff
}'
done > dif_day
#全てのCHのdiffを書き出す

cp $ana_alpaca/count/$date_dir/dif_day /home/sanchu/monitor///count_pdf/$date_dir

cd /home/sanchu/monitor//

python ./fetch_flare.py > tmp_flare
mv tmp_flare /home/sanchu/monitor///count_pdf/$date_dir

efmdir=/disk/alpaca/data/em/EFM100/data/

#cat analysis_$i.g | sed 's/xxxx/'"$date_dir"'/g'>tmp.g
cat dif_day.g | sed 's/xxxx/'"$date_dir"'/g'>tmp.g
gnuplot tmp.g

cat min_max_scatter | sed 's/yyyy/'"$date_dir"'/g' > tmp_min-max
root -b -q tmp_min-max

cat 2d_hist | sed 's/zzzz/'"$date_dir"'/g' > tmp_2d_hist
root -b -q tmp_2d_hist

echo $yesterday
cat ptu | sed 's/xxxx/'$yesterday'/g' | sed 's/yyyy/'"$date_dir"'/g' > tmp_ptu
root -b -q tmp_ptu

python readEFM.py $efmdir/$yyesterday.dat > tmp_efm.txt
python readEFM.py $efmdir/$yesterday.dat >> tmp_efm.txt

cat tmp_efm.txt | awk '{print strftime("%Y%m%d %H:%M", $1) " " $0}' | grep $yesterday | awk '{print $3 " " $4}' > tmp.txt
mv tmp.txt tmp_efm.txt

cat efm.cxx | sed 's/xxxx/'"$date_dir"'/g' > tmp_efm.cxx
root -b -q tmp_efm.cxx
rm tmp_efm.txt

cat ptu_temp | sed 's/xxxx/'$yesterday'/g' | sed 's/yyyy/'"$date_dir"'/g' > tmp_ptu_temp
root -b -q tmp_ptu_temp

root -b -q 'anyi_per_min.cxx(1, "'$yesterday_hyp'")'
root -b -q 'anyi_per_min.cxx(60, "'$yesterday_hyp'")'
root -b -q 'anyi_per_min.cxx(300, "'$yesterday_hyp'")'
root -b -q 'anyi_per_min.cxx(1500, "'$yesterday_hyp'")'

echo fin

cp $ana_alpaca/count/$date_dir/tmp_alert /home/sanchu/monitor///count_pdf/$date_dir
cp $ana_alpaca/count/$date_dir/min_max_scatter /home/sanchu/monitor///count_pdf/$date_dir

cat count_top.html | sed 's/xxxx/'"$date_dir"'/g' | sed 's/ystd/'"$previous_day"'/g' | sed 's/tmrw/'"$next_day"'/g'>tmp.html

cp /home/sanchu/monitor///tmp.html /home/sanchu/monitor///count_pdf/$date_dir/index.html
cp /home/sanchu/monitor///style.css /home/sanchu/monitor///count_pdf/$date_dir/style.css

echo $date_dir >> valid-dates.sh
rm core-root*
#sh gen_index.sh
