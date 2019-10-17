# check whether ZSH is installed
which zsh
if [ $? -ne 0 ]
then
    echo "Make sure ZSH is installed before running the script"
    return
fi

# custom install script for zsh
CONFIG="$HOME/dotfiles/zsh"
OHMYZSH="$HOME/.config/oh-my-zsh"

# clone oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $OHMYZSH

# setup symlinks
ln -s $CONFIG/zshrc $HOME/.zshrc
echo "Created symlink to .zshrc"

ln -s $CONFIG/thunder.zsh $OHMYZSH/custom/themes/
echo "Created symlink to custom theme"

ln -s $CONFIG/aliases.zsh $OHMYZSH/custom/
echo "Created symlink to custom aliases"

# clone custom plugins
PLUGIN_FILE="$OHMYZSH/custom/plugins.zsh"
echo "plugins=(" > $PLUGIN_FILE

base_url="https://github.com/zsh-users"
plugins=("zsh-autosuggestions" "zsh-syntax-highlighting")
echo "Installing custom plugins"

for plug in "${plugins[@]}"
do
    echo "\t$plug" >> $PLUGIN_FILE
    git_repo="$base_url/$plug.git"
    git clone $git_repo "$OHMYZSH/custom/plugins/$plug"
done

echo ")" >> $PLUGIN_FILE
