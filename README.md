# Reinventing the Dotfile Wheel
Other people have done this better. But this is how I did it.

## Prereqs and Assumptions
- OSX
- `$HOME/.oh-my-zsh`
- [Powerline-fonts][powerline-fonts] [installed][powerline-fonts-install]
- virtualenvs in `$HOME/dev/`. I don't use virtualenvwrapper because I'm a snob

## Install
Not very portable right now; only really ready to mimic my initial setup.

```sh
git clone git@github.com:crgk/dotfiles.git ~/dotfiles
~dotfiles/install.zsh
```

The `install.zsh` script will try to move existing dotfiles to a backup
location, currently `$HOME/old_dotfiles`. Then it makes symlinks to the necessary
files in `$HOME/dotfiles`.


## TODO
- [ ] include oh-my-zsh?
- [ ] gitconfigs?
- [ ] include powerline fonts?
- [ ] include solarizer?
- [ ] Ubuntu support
- [ ] install `chadnoster.zsh-theme`


[powerline-fonts]: https://github.com/Lokaltog/powerline-fonts
[powerline-fonts-install]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
