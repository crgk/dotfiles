#####################################
# install.zsh
# Make symlinks for my dotfiles
####################################

dotfiles=~/dotfiles
backup=~/old_dotfiles
files="vimrc zshrc zsh_profile zsh_aliases zsh_prompt zshenv"

# create dotfile backup folder
mkdir -p $backup

# move dotfiles around
for file in $files; do
    mv ~/.$file $backup/
    ln -s $dotfiles/$file ~/.$file
done
