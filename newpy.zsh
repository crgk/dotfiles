#! /usr/bin/zsh
DOTFILES=~/dotfiles

DEFAULT_PY=/usr/bin/python
DEFAULT_ENV_DIR=~/dev/wf

function newpy {
    # USAGE:
    # $ newpy my_environment /usr/bin/python2.7  ~/dev/crgk

    if (( $# < 1))
        then 
            print "newpy: usage: newpy env_name";
            return 1;
    fi

    env_name=$1
    
    python=$2
    if [ ! -a "$python" ];
        then
            print "warning: $python is not a valid python executable. defaulting to $DEFAULT_PY";
            python=$DEFAULT_PY;
    fi

    env_dir=$3
    if [ ! -d "$env_dir" ];
        then
            print "warning: $env_dir is not a valid directory. defaulting to $DEFAULT_ENV_DIR";
            env_dir=$DEFAULT_ENV_DIR;
    fi

    workspace=$4
    if [ ! -d "$workspace" ];
        then
            print "info: defaulting workspace to current directory";
            workspace=`pwd`;
    fi

    print "Creating a new python virtual environment named $env_name"
    print "  at $env_dir"
    print "  with --python=$python"
    print "  for workspace '$workspace'"

    cd $env_dir
    virtualenv $env_name --python=$python 
    
    if [ ! "`alias -L $env_name`" ]
        then
            print "Creating alias for $env_name";
            echo "alias $env_name=\"cd $workspace && source $env_dir/$env_name/bin/activate\"" >> $DOTFILES/aliases/venvs.zsh;
            echo "" >> $DOTFILES/aliases/venvs.zsh;
        else
            print "Alias $env_name already defined";
    fi

    source $DOTFILES/aliases/venvs.zsh
    cd -
}
