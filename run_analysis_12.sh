#!/bin/sh
#PJM -L "elapse=00:30:00"
#PJM -L "rscunit=unit1"
#PJM -L "rscgrp=A"
#PJM -L "vnode=1"
#PJM -L "vnode-core=1"

ROOTSYS=/usr/local/gcc485/ROOT/6.08.06
PATH=$ROOTSYS/bin:$HOME/bin:$PATH:/usr/local/gcc485/ROOT/6.08.06/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/gcc485/ROOT/6.08.06/bin
LD_LIBRARY_PATH=$ROOTSYS/lib/root:$LD_LIBRARY_PATH

export PATH
export LD_LIBRARY_PATH

data_dir=/disk/alpaca/data/as/rawdata
count_dir=/home/sanchu/monitor/count
ana_alpaca=/home/sanchu/monitor

date_fixed="2025-10-06"

if [ $# -eq 0 ]; then
  target_date=$date_fixed
else
  target_date=$1
fi

date_dir=`date -d $target_date +%y%m%d`
previous_day=`date -d "$target_date -1 day" +%y%m%d`
next_day=`date -d "$target_date +1 day" +%y%m%d`
yesterday=$(date -d "$target_date" "+%Y%m%d")
yyesterday=$(date -d "$target_date -1 day" "+%Y%m%d")
yesterday_hyp=$(date -d "$target_date" "+%y-%m-%d")

mkdir -p $ana_alpaca/count_pdf/$date_dir

cd $ana_alpaca
cat analysis_12.g | sed 's/xxxx/'"$date_dir"'/g' > tmp.g
gnuplot tmp.g

