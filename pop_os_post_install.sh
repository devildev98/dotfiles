#!/bin/bash
#
# Ubuntu post-install script
#
# Author:
#   Debarghy Datta <debarghya.datta89gmail.com>
#
# Description:
#   A post-installation bash script for Ubuntu (20.10)
#
# Based on marco[0] script.
#
# [0] - http://gist.github.com/raw/8108714/ubuntu-post-install.sh
#
# Usage:
#   $ cd /tmp
#   $ wget http://gist.github.com/raw/8108714/ubuntu-post-install.sh
#   $ chmod +x post-install.sh
#   $ ./post-install.sh
#

echo '------------------------------------------------------------------------'
echo '=> Ubuntu 20.10 post-install script'
echo '------------------------------------------------------------------------'

# -----------------------------------------------------------------------------
# => Add PPAs (Personal Package Archives)
# -----------------------------------------------------------------------------
echo '=> Add PPAs'
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 # Sublime Text 3
echo 'Done.'

# -----------------------------------------------------------------------------
# => System update/upgrade
# -----------------------------------------------------------------------------
echo '=> Update repository information'
sudo apt-get update -qq
echo '=> Performe system upgrade'
sudo apt-get dist-upgrade -y
echo 'Done.'

# -----------------------------------------------------------------------------
# => Get dotfiles
# -----------------------------------------------------------------------------
echo '=> Getting dotfiles (http://github.com/devildev89/dotfiles)'

# Create a tmp folder with random name
dotfiles_path="`(mktemp -d)`"

# Clone the repository recursively
git clone --recursive https://github.com/devildev89/dotfiles.git "$dotfiles_path"
cd "$dotfiles_path"

# Copy all dotfiles except .git/ and .gitmodules
cp -r .config ~/.config
cp -r Fonts/ ~/.fonts
cp -r wallpapers ~/Pictures
cp -r ~/.config/scripts/ ~/.local/bin/

echo 'Done.'

# -----------------------------------------------------------------------------
# => Install Alacritty
# -----------------------------------------------------------------------------
echo '=> Installing Alacritty'
sudo apt install alacritty -y
echo 'Done.'

# -----------------------------------------------------------------------------
# => Install fish Shell and exa
# -----------------------------------------------------------------------------
echo '=> Installing Fish shell and Exa'
sudo apt install fish -y
sudo apt install exa -y
echo 'Done.'

# -----------------------------------------------------------------------------
# => Install Neovim
# -----------------------------------------------------------------------------
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
echo '=> Installing Neovim'
sudo apt install neovim -y
echo 'Done.'
echo '=> Configuring Neovim'
nvim --headless +PluginInstall +quit +quit
echo '=> Configuration Done'

# -----------------------------------------------------------------------------
# => Install Starship Prompt
# -----------------------------------------------------------------------------
echo '=> Installing Starship Prompt'
curl -fsSL https://starship.rs/install.sh| bash # [-fy]
echo 'Done.'

# -----------------------------------------------------------------------------
# => Install Miniconda
# -----------------------------------------------------------------------------
echo '=> Installing Miniconda'
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
echo 'Done.'

# -----------------------------------------------------------------------------
# => Install Apllications
# -----------------------------------------------------------------------------
echo "=> Installing Imp Applications"
echo "=> 1. Lollypop (Music Player)"
echo "=> 2. VS Code"
echo "=> 3. Sublime Text"
echo "=> 4. VLC"
echo "=> 5. Tweak Tools"
echo "=> 6. htop"
sudo apt install -y lollypop code sublime-text vlc gnome-tweak-tool htop
echo 'Done.'

# --------------
# TODO
# --------------
# - Foliate
# - Manga Reader
# - setup vscode

# -----------------------------------------------------------------------------
# => Configuring Shell & Terminal
# -----------------------------------------------------------------------------
echo '=> Changing shell to fish'
chsh -s /usr/bin/fish

# set user paths
fish
set -U fish_user_paths ~/.local/bin $fish_user_paths
exit
