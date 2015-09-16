#! /usr/bin/zsh
#####################################
# install.zsh
# Make symlinks for my dotfiles
####################################

dotfiles=$HOME/dotfiles
backup=$HOME/old_dotfiles
files=("vimrc" "work_exports" "zsh_aliases" "zsh_archive" "zsh_profile" "zsh_prompt" "zshrc")

# move dotfiles around
for file in $files; do
    ln -s -f $dotfiles/$file $HOME/.$file;
done
