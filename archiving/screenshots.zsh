#!/bin/zsh
SCREENSHOTS_DIR=${HOME}/Pictures/Screenshots

yesterday="$(date -v-1d +%Y.%m.%d)"
yesterday_dir=${SCREENSHOTS_DIR}/archive/${yesterday}

if [ ! -d "$yesterday_dir" ];
    then
        print "Archiving past screenshots...";
        mkdir -p $yesterday_dir;
        mv $SCREENSHOTS_DIR/*.png $yesterday_dir;
    else
        print "Past screenshots already archived: "${yesterday_dir};
fi
