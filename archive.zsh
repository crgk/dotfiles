#! /usr/bin/zsh

function archive {
    if (( $# < 3))
        then 
            print "archive: usage: archive target name pattern";
            return 1;
    fi
    emulate -L zsh
    setopt extendedglob;

    target=$1
    name=$2
    pattern=$3

    yesterday="$(date -v-1d +%Y/%m/%d)"
    yesterday_dir=${target}/archive/${yesterday}

    if [ ! -d "$yesterday_dir" ];
        then
            print "archive: archiving past $name...";
            mkdir -p $yesterday_dir;
            mv ${~pattern} ${yesterday_dir};
        else
            print "archive: past $name already archived: $yesterday_dir";
    fi
}
