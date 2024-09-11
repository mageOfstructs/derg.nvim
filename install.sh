#!/bin/sh
set -e
set -x
CUR_PATH=$(dirname "$0")

NERD_FONT_NAME="JetBrainsMono"
NERD_FONT_EXT=".zip"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/$NERD_FONT_NAME$NERD_FONT_EXT"

NEOVIM_CONFIG_USERNAME="ThronKatze0"
NEOVIM_CONFIG_REPO_NAME="neovim-config"
NEOVIM_CONFIG_URL="https://github.com/$NEOVIM_CONFIG_USERNAME/$NEOVIM_CONFIG_REPO_NAME"

UNHOLY_KITTY_COMMAND="$CUR_PATH/bin/kitty --start-as=fullscreen --hold -o \"font_family=JetBrainsMono Nerd Font\" $CUR_PATH/nvim.appimage"

export PATH="$PATH:$CUR_PATH"

# download and install nerd font
mkdir -p ~/.fonts/$NERD_FONT_NAME
curl -sL $NERD_FONT_URL -o $CUR_PATH/$NERD_FONT_NAME$NERD_FONT_EXT
# tar xpvf $CUR_PATH/$NERD_FONT_NAME.tar.xz --acls -C ~/.fonts/$NERD_FONT_NAME
unzip -d ~/.fonts/$NERD_FONT_NAME $CUR_PATH/$NERD_FONT_NAME$NERD_FONT_EXT

# THIS SINGLE COMMAND MUTILATES THE FONT FILES (which it doesn't even touch) BEYOND ANY TERMINAL'S RECOGNITION!!!
#chmod 644 ~/.fonts/* # just as a sanity check

# clone neovim config
git clone $NEOVIM_CONFIG_URL ~/.config/nvim
curl -sL https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage -o $CUR_PATH/nvim.appimage
chmod +x $CUR_PATH/nvim.appimage

# Install kitty
curl -sL https://github.com/kovidgoyal/kitty/releases/download/v0.35.1/kitty-0.35.1-x86_64.txz -o $CUR_PATH/kitty.txz
tar Jxvf $CUR_PATH/kitty.txz # -C <some_dir> TODO: implement this
echo All done! You may need to restart NeoVim a few times

echo Also, if you accidentally closed the kitty terminal \(you weren\'t supposed to do that\). Just run the \'start_kitty.sh\' script, provided for your convenience
echo $UNHOLY_KITTY_COMMAND >>$CUR_PATH/start_kitty.sh
echo "alias nvim=$CUR_PATH/nvim.appimage" >>~/.bashrc
chmod +x $CUR_PATH/start_kitty.sh

$CUR_PATH/bin/kitty --start-as=fullscreen --hold -o "font_family=JetBrainsMono Nerd Font" $CUR_PATH/nvim.appimage
