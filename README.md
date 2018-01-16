# Dotfiles for my system
* A custom tweaked vimrc file suited to my personal tastes.
* A bashrc for an informative and pleasant prompt at command line
* Termite config
* ncmpcpp config
* dunst config

## Steps for setting up vim:
* Clone the repo
* Create a symlink to vimrc in your home folder:

 `$ln -s dotfiles/.vimrc ~/.vimrc`
 
 This would emulate the presence of a vimrc file in your home directory.
 
 * It is advisable to delete the .vim directory and start fresh. So create a new .vim directory:
 
 `rm -rf .vim`
 `mkdir .vim`
 
 * [Install Bundle](https://github.com/VundleVim/Vundle.vim)

 * open vim & run 
 
 `: PluginInstall`

## Setting up other configs
* Create hard links(or soft links if you wish) to the appropriate locations either in ~/.config/(location) OR ~/(location)
* Example: termite config resides at: ~/.config/termite/config
