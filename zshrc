#!/bin/zsh
# vim: set foldmarker=<<,>> foldlevel=1 foldmethod=marker:
#===================================================================================
#  DESCRIPTION:  Damn if feels good to be a gangster
#       AUTHOR:  Jarrod Taylor
#                 .__
#  ________  _____|  |_________   ____
#  \___   / /  ___/  |  \_  __ \_/ ___\
#   /    /  \___ \|   Y  \  | \/\  \___
#  /_____ \/____  >___|  /__|    \___  >
#        \/     \/     \/            \/
#
#===================================================================================
#

# General Settings <<1
# Autoload colors and tab completion <<2
#-------------------------------------------------------------------------------
autoload -U colors && colors
autoload -U compinit
compinit -C
# >> 2
# Modify default zsh directory coloring on ls commands <<2
#-------------------------------------------------------------------------------
export LSCOLORS=gxbxcxdxfxegedabagacad
# >>2
# case-insensitive (all),partial-word and then substring completion <<2
#-------------------------------------------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# >>2
# Local array variable <<2
#-------------------------------------------------------------------------------
local -a precmd_functions
# >>2
# Set the desired setup options man zshoptions <<2
#-------------------------------------------------------------------------------
# If command can't be executed, and command is name of a directory, cd to directory
setopt  auto_cd
# Make cd push the old directory onto the directory stack.
setopt  auto_pushd
# Safty for overwriting files use >| instead of > to over write files
setopt  noclobber
# Prevents aliases on the command line from being internally substituted before
# completion is attempted. The effect is to make the alias a distinct command
# for completion purposes.
setopt  complete_aliases
# Treat the #, ~ and ^ characters as part of patterns for filename
# generation, etc.  (An initial unquoted `~' always produces named directory
# expansion.)
setopt  extended_glob
# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the pre‐ vious event).
setopt  hist_ignore_all_dups
#  Remove command lines from the history list when the first character on the line
#  is a space, or when one of the expanded aliases contains a leading space.
setopt  hist_ignore_space
# This  option  both  imports new commands from the history file, and also
# causes your typed commands to be appended to the history file
setopt  share_history
setopt  noflowcontrol
# When listing files that are possible completions, show the type of each file
# with a trailing identifying mark.
setopt  list_types
# Append a trailing / to all directory names resulting from filename
# generation (globbing).
setopt  mark_dirs
# Perform a path search even on command names with slashes in them.
# Thus if /usr/local/bin is in the user's path, and he or she types
# X11/xinit, the  command /usr/local/bin/X11/xinit will be executed
# (assuming it exists).
setopt  path_dirs
# If set, `%' is treated specially in prompt expansion.
setopt  prompt_percent
# If set, parameter expansion, command substitution and arithmetic
# expansion are performed in prompts.
# Substitutions within prompts do not affect the command status.
setopt  prompt_subst
# >>2
# History settings <<2
#-------------------------------------------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTFILESIZE=65536  # search this with `grep | sort -u`
HISTSIZE=4096
SAVEHIST=4096
REPORTTIME=60       # Report time statistics for progs that take more than a minute to run
# >>2
# utf-8 in the terminal, will break stuff if your term isn't utf aware <<2
#-------------------------------------------------------------------------------
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export LC_COLLATE=C
# >>2
# Set grepoptions <<2
#-------------------------------------------------------------------------------
export GREP_OPTIONS='--color=auto'
# >>2
# Alows Mac to use the correct ctags, old version installed by default <<2
#-------------------------------------------------------------------------------
PATH="/usr/local/bin:$PATH"
# >>2
# Editor and display configurations <<2
#-------------------------------------------------------------------------------
export EDITOR='vim'
export VISUAL='vim'
export GIT_EDITOR=$EDITOR
export LESS='-imJMWR'
export PAGER="less $LESS"
export MANPAGER=$PAGER
export GIT_PAGER=$PAGER
export BROWSER='chromium-browser'
# >>2
# Silence Wine debugging output <<2
#-------------------------------------------------------------------------------
export WINEDEBUG=-all
# >>2
# Specify virtualenv directories <<2
#-------------------------------------------------------------------------------
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/VirtualDevEnvs
# >>2
# completion settings <<2
#-------------------------------------------------------------------------------
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle -e ':completion:*:(ssh|scp|sshfs|ping|telnet|nc|rsync):*' hosts '
    reply=( ${=${${(M)${(f)"$(<~/.ssh/config)"}:#Host*}#Host }:#*\**} )'
# >>2
# >>1

# Key Bindings <<1
#-------------------------------------------------------------------------------
# Set vi-mode and create a few additional Vim-like mappings
#-------------------------------------------------------------------------------
# bindkey -v
# bindkey '^R' history-incremental-search-backward
# bindkey '^R' history-incremental-pattern-search-backward
# bindkey '^?' backward-delete-char
# bindkey '^H' backward-delete-char
# >>1

# Set up the prompt <<1
#-------------------------------------------------------------------------------
if [[ ! -n "$ZSHRUN" ]]; then
    source $HOME/.zsh_prompt

    # # Fish shell like syntax highlighting for Zsh:
    # # git clone git://github.com/nicoulaj/zsh-syntax-highlighting.git \
    # #   $HOME/.zsh-syntax-highlighting/
    # if [[ -f $HOME/zsh-syntax-highlighting.zsh ]]; then
    #     source $HOME/zsh-syntax-highlighting.zsh
    #     ZSH_HIGHLIGHT_HIGHLIGHTERS+=( brackets pattern cursor )
    # else
    #     echo "No highlighting Son!!"
    # fi
fi
# >>1

#  Aliases <<1
#-------------------------------------------------------------------------------
# alias ls='ls -FHG'
# alias ll='ls -lh'
# alias la='ls -la'
# alias lls='ll -Sr'
# alias less='less -imJMW'
# alias update='brew update && brew upgrade'
# alias upgrade='brew upgrade'
# alias clean='brew doctor'
# alias root_trash='sudo bash -c "exec rm -r /root/.local/share/Trash/{files,info}/*"'
# alias tmux="TERM=screen-256color-bce tmux"  # Fix tmux making vim colors funky
# alias ..='cd ..'
# alias ...='cd ../..'
# alias ....='cd ../../..'
# alias .....='cd ../../../..'
# alias ping='ping -c 5'      # Pings with 5 packets, not unlimited
# alias ad='add_current_directory_to_path'
# alias gs='git status'
# alias gd='git diff'
# alias ts='tig status'
# alias delete_pyc='find . -name \*.pyc -exec rm \{\} \+'
# >>1

# Functions <<1
#===============================================================================

# Python webserver <<2
#-------------------------------------------------------------------------------
#  cd into a directory you want to share and then
#  type webshare. You will be able to connect to that directory
#  with other machines on the local net work with IP:8000
#  the function will display the current machines ip address
#-------------------------------------------------------------------------------
function webshare() {
    local_ip=`hostname -I | cut -d " " -f 1`
    echo "connect to $local_ip:8000"
        python -m SimpleHTTPServer > /dev/null 2>&1
    }
# >>2
# Work Timer <<2
#-------------------------------------------------------------------------------
# A timer function that will say the message and display a pop-up
# after the specified amount of time.
#-------------------------------------------------------------------------------
function workTimer() {
    echo -n "How long to set timer for? (ex. 1h, 10m, 20s, etc) => "; read duration
    echo -n "What to words_to_say when done => "; read words_to_say
    sleep $duration && say "$words_to_say"
}
# >>2
# Memory Usage <<2
#-------------------------------------------------------------------------------
# Shows the specified number of the top memory consuming processes and their PID
#-------------------------------------------------------------------------------
function mem_usage() {
    echo -n "How many you what to see? "; read number
    echo ""
    echo "Mem Size       PID     Process"
    echo "============================================================================="
    ps aux | awk '{ output = sprintf("%5d Mb --> %5s --> %s%s%s%s", $6/1024, $2, $11, $12, $13, $14); print output }' | sort -gr | head -n $number
    }
# >>2
# Spell Check <<2
#------------------------------------------------------------------------------
# Because, well I need to spell check a lot :\
#------------------------------------------------------------------------------
spell (){
    echo $1 | aspell -a
}
# >>2
# Workon virtualenv <<2
#--------------------------------------------------------------------
# If we cd into a directory that is named the same as a virtualenv
# auto activate that virtualenv
# -------------------------------------------------------------------
# [[ -a /usr/local/share/python/virtualenvwrapper.sh ]] && source /usr/local/share/python/virtualenvwrapper.sh
# [[ -a /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# workon_virtualenv() {
#   if [[ -d .git ]]; then
#      VENV_CUR_DIR="${PWD##*/}"
#      if [[ -a ~/.virtualenvs/$VENV_CUR_DIR ]]; then
#        deactivate > /dev/null 2>&1
#        source ~/.virtualenvs/$VENV_CUR_DIR/bin/activate
#      fi
#   fi
# }
# >>2
# Workon node env <<2
#--------------------------------------------------------------------
# If we cd into a directory that contains a directory named node_modules
# we automatically add it to the $PATH
# -------------------------------------------------------------------
# workon_node_env() {
#   if [[ -d "node_modules" ]]; then

#     export NPM_ORIGINAL_PATH=$PATH
#     eval NODE_NAME=$(basename $(pwd))
#     export PATH="${PATH}:$(pwd)/node_modules/.bin"

#     deactivatenode(){
#       export PATH=$NPM_ORIGINAL_PATH
#       unset -f deactivatenode
#       unset NODE_NAME
#     }
#   fi
# }
# >>2
# Run the virtual environments functions for the prompt on each cd <<2
# -------------------------------------------------------------------
# cd() {
#   builtin cd "$@"
#   unset NODE_NAME
#   # workon_virtualenv
#   # workon_node_env
# }
# >>2
# Search for running processes <<2
# -------------------------------------------------------------------
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND"
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}
# >>2
# Display a neatly formatted path <<2
# -------------------------------------------------------------------
path() {
echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
  }
# >>2
# Displays mounted drive information in a nicely formatted manner <<2
# -------------------------------------------------------------------
function nicemount() {
    (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ;
}
# >>2
# Source file if it exists <<2
#--------------------------------------------------------------------
include () {
    [[ -s "$1" ]] && source "$1"
}
# >>2
# >>1

# Precmd functions <<1
#------------------------------------------------------------------------------
# Run precmd functions so we get our pimped out prompt
#------------------------------------------------------------------------------
precmd_functions=( precmd_prompt )

# >>1
# EOF
