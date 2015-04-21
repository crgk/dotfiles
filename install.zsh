#####################################
# install.zsh
# Make symlinks for my dotfiles
####################################

dotfiles=$HOME/dotfiles
backup=$HOME/old_dotfiles
files=("vimrc" "work_exports" "zsh_aliases" "zsh_profile" "zsh_prompt" "zshrc")

# remove existing backup folder because who gives a fuck
echo "Removing backup files at $backup"
rm -r $backup

# create dotfile backup folder
mkdir -p $backup

# move dotfiles around
for file in $files; do
    mv $HOME/.$file $backup/
    ln -s $dotfiles/$file $HOME/.$file 
done
