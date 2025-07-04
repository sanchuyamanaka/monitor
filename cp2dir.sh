#!/bin/bash

tgt_dir=$1
prev_dir=/home/sanchu/monitor/

replace_path () {
  local file=$1
  local prev=$2
  local tgt=$3
  cat $file | sed -e "s|$prev|$tgt|g" > tmp.txt && mv tmp.txt $file
}

cp $prev_dir/analysis.sh $tgt_dir
cp $prev_dir/dread_alpaca_count $tgt_dir
cp $prev_dir/analysis*.g $tgt_dir
cp $prev_dir/any{1..4} $tgt_dir
cp $prev_dir/any2cluster $tgt_dir
cp $prev_dir/fetch_flare.py $tgt_dir
cp $prev_dir/dif_day.g $tgt_dir
cp $prev_dir/min_max_scatter $tgt_dir
cp $prev_dir/2d_hist $tgt_dir
cp $prev_dir/ptu $tgt_dir
cp $prev_dir/ptu_temp $tgt_dir
cp $prev_dir/readEFM.py $tgt_dir
cp $prev_dir/efm.cxx $tgt_dir
cp $prev_dir/anyi_per_min.cxx $tgt_dir
cp $prev_dir/count_top.html $tgt_dir
cp $prev_dir/index.html $tgt_dir
cp $prev_dir/style.css $tgt_dir

cd $tgt_dir
for file in $(ls $tgt_dir); do
  replace_path $file $prev_dir $tgt_dir
done
