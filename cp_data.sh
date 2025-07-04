#!/bin/bash

orig_path=/home/sanchu/monitor/
data_path=$orig_path"count_pdf/"
html_path=/wwwhome/sanchu/public_html/
date=$(date --date "1 day ago" "+%y%m%d")

echo $date
echo $date >> /wwwhome/sanchu/public_html/valid-dates.txt

echo $data_path$date $html_path"count_pdf"
cp -r $data_path$date $html_path"count_pdf"
