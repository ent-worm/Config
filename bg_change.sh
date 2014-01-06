#!/bin/bash
#Description: download national geographic photo of the day and set it as background

# wait for network connection to be established
[[ -n $1 ]] && sleep $1

resolution=$(xrandr |grep -o 'current [^,]*'|tr -d " "|sed 's:current::')

rss=`wget -q -O - http://feeds.nationalgeographic.com/ng/photography/photo-of-the-day/`

img_url=$(echo $rss|grep -o "http://[^\" ]*/exposure/[^\"]*"|head -1|sed -s 's:360x270:'"$resolution"':')

img=~/pod.jpg

echo Image URL: $img_url

curl $img_url -o $img

awsetbg $img
