#!/bin/sh
#set -e
CUR_PATH=$(dirname $(readlink -f $0))

NERD_FONT_NAME="JetBrainsMono"
NERD_FONT_EXT=".zip"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/$NERD_FONT_NAME$NERD_FONT_EXT"

NVIM_APPIMAGE_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"

NEOVIM_CONFIG_USERNAME="mageOfStructs"
NEOVIM_CONFIG_REPO_NAME="derg.nvim"
NEOVIM_CONFIG_URL="https://codeberg.org/$NEOVIM_CONFIG_USERNAME/$NEOVIM_CONFIG_REPO_NAME"
ALT_NEOVIM_CONFIG_URL="https://github.com/$NEOVIM_CONFIG_USERNAME/$NEOVIM_CONFIG_REPO_NAME"

UNHOLY_KITTY_COMMAND="$CUR_PATH/root/bin/kitty --hold -o \"font_family=JetBrainsMono Nerd Font\" $CUR_PATH/nvim.appimage"

readonly LUA_VERSION="5.1.5"

# install rust
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#. "$HOME/.cargo/env"

#cargo install ripgrep yazi-cli yazi-fmt &

# download and install nerd font
mkdir -p ~/.fonts/$NERD_FONT_NAME
curl -sL $NERD_FONT_URL -o $CUR_PATH/$NERD_FONT_NAME$NERD_FONT_EXT
# tar xpvf $CUR_PATH/$NERD_FONT_NAME.tar.xz --acls -C ~/.fonts/$NERD_FONT_NAME
unzip -d ~/.fonts/$NERD_FONT_NAME $CUR_PATH/$NERD_FONT_NAME$NERD_FONT_EXT

# THIS SINGLE COMMAND MUTILATES THE FONT FILES (which it doesn't even touch) BEYOND ANY TERMINAL'S RECOGNITION!!!
#chmod 644 ~/.fonts/* # just as a sanity check

# clone neovim config
git clone $NEOVIM_CONFIG_URL ~/.config/nvim
if [[ $? -eq 128 ]]; then
    git clone $ALT_NEOVIM_CONFIG_URL ~/.config/nvim
fi

curl -sL $NVIM_APPIMAGE_URL -o $CUR_PATH/nvim.appimage
chmod +x $CUR_PATH/nvim.appimage

mkdir -p "$CUR_PATH/root"

# Install kitty
curl -sL https://github.com/kovidgoyal/kitty/releases/download/v0.35.1/kitty-0.35.1-x86_64.txz -o $CUR_PATH/kitty.txz
tar Jxvf $CUR_PATH/kitty.txz -C "$CUR_PATH/root"

git clone https://github.com/gnu-mirror-unofficial/readline
cd readline
./configure
make
sed -i Makefile -e "s/DESTDIR =/DESTDIR = ..\/root/"
make install
cd ..

# Lua 5.1
curl -sL https://www.lua.org/ftp/lua-$LUA_VERSION.tar.gz -o $CUR_PATH/lua.tar.gz
tar xf lua.tar.gz && cd lua-$LUA_VERSION
make linux
sed -i Makefile -e "s/\usr\/local/..\/root/"
make install
cd ..

mkdir -p ~/.local
ln -sf $CUR_PATH/root/bin /home/$USER/.local/bin
export PATH="$PATH:/home/$USER/.local/bin"
echo "PATH=$PATH" >>~/.bashrc
echo "alias nvim=$PWD/nvim.appimage" >>~/.bashrc

chmod +x $CUR_PATH/start_kitty.sh
ln -sf $CUR_PATH/start_kitty.sh /home/$USER/.local/bin/ks

echo All done! You may need to restart NeoVim a few times

echo If you accidentally closed the kitty terminal \(you weren\'t supposed to do that\). Just run the \'start_kitty.sh\' script, provided for your convenience
echo $UNHOLY_KITTY_COMMAND >>$CUR_PATH/start_kitty.sh
