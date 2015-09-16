#!/bin/zsh
SCREENSHOTS_DIR=${HOME}/Pictures/Screenshots

today="$(date +%Y.%m.%d)"
today_dir=${SCREENSHOTS_DIR}/${today}

if [ ! -d "$today_dir" ];
    then
        print "Archiving past screenshots...";
        mkdir -p $today_dir;
        mv $SCREENSHOTS_DIR/*.png $today_dir;
fi
