#!/bin/sh
set -e
set -x
CUR_PATH=$(dirname "$0")

NERD_FONT_NAME="JetBrainsMono"
NERD_FONT_EXT=".zip"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/$NERD_FONT_NAME$NERD_FONT_EXT"

NEOVIM_CONFIG_USERNAME="mageOfstructs"
NEOVIM_CONFIG_REPO_NAME="nvim-config"
NEOVIM_CONFIG_URL="https://github.com/$NEOVIM_CONFIG_USERNAME/$NEOVIM_CONFIG_REPO_NAME"

export PATH="$PATH:$CUR_PATH"

# download and install nerd font
mkdir -p ~/.fonts/$NERD_FONT_NAME
curl -sL $NERD_FONT_URL -o $CUR_PATH/$NERD_FONT_NAME$NERD_FONT_EXT
# tar xpvf $CUR_PATH/$NERD_FONT_NAME.tar.xz --acls -C ~/.fonts/$NERD_FONT_NAME
unzip -d ~/.fonts/$NERD_FONT_NAME $CUR_PATH/$NERD_FONT_NAME$NERD_FONT_EXT
chmod 644 ~/.fonts/* # just as a sanity check

# clone neovim config
git clone $NEOVIM_CONFIG_URL ~/.config/nvim

curl -sL https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage -o $CUR_PATH/nvim.appimage
chmod +x $CUR_PATH/nvim.appimage
echo All done! You may need to restart NeoVim a few times
ln -sf $CUR_PATH/nvim.appimage $CUR_PATH/nvim
$CUR_PATH/nvim.appimage
