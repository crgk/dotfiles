#####################################
# install.zsh
# Make symlinks for my dotfiles
####################################

dotfiles=$HOME/dotfiles
backup=$HOME/old_dotfiles
files="vimrc zsh_aliases zsh_profile zsh_prompt zshrc"

# create dotfile backup folder
mkdir -p $backup

# move dotfiles around
for file in $files; do
    mv $HOME/.$file $backup/
    ln -s $dotfiles/$file $HOME/.$file
done
