#!/bin/bash
export alacConfRoot="/home/marcus/.dots/alacritty"
export srcCronTabPath="$alacConfRoot/crontab-alacritty-update-color.txt"
export cronDir="/etc/cron.hourly"
export cronAlacServicePath="$alacCronDir/alacritty-color-change.service"
# export cronAlacServicePath="$alacConfRoot/test.txt"


if [[ -f $alacCronServicePath ]]; then
    echo "file exists!"
    echo "cronAlacServicePath = $cronAlacServicePath"
    rm $cronAlacServicePath
else
    echo "file doesn't exist"
fi
touch $cronAlacServicePath; cat $srcCronTabPath > $cronAlacServicePath


