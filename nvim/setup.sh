# Check if neovim is installed
which nvim
if [ $? -ne 0 ]
then
    echo "Make sure Neovim is installed before running the script"
    return
fi

CONFIG="$HOME/dotfiles/nvim"
NVIM="$HOME/.config/nvim"

[ -d $NVIM ] || mkdir -p $NVIM/{config,plugged}
echo "Creating symlinks"
set -x
ln -s $CONFIG/init.vim $NVIM/
ln -s $CONFIG/config/init.vimrc $NVIM/config/
ln -s $CONFIG/config/plugins.vimrc $NVIM/config/
ln -s $CONFIG/config/general.vimrc $NVIM/config/
ln -s $CONFIG/config/mappings.vimrc $NVIM/config/
ln -s $CONFIG/config/colors.vimrc $NVIM/config/
