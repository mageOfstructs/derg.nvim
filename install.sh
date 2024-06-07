#!/bin/sh
set -e
CUR_PATH=$(dirname "$0")

NERD_FONT_NAME=""
NERD_FONT_URL=""

NEOVIM_CONFIG_URL=""

export PATH="$PATH:$CUR_PATH"

# download and install nerd font
mkdir -p ~/.fonts
curl -sL $NERD_FONT_URL -o ~/fonts/$NERD_FONT_NAME.ttf
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "$NERD_FONT_NAME"

# clone neovim config
git clone $NEOVIM_CONFIG_URL ~/.config/nvim

echo All done! You may need to restart NeoVim a few times
nvim
