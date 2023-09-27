#!/bin/sh

sudo pacman -S wlroots polkit sway swaybg swaylock foot zsh zsh-syntax-highlighting zsh-autosuggestions neofetch htop i3blocks neovim zathura zathura-pdf-poppler bemenu git xdg-utils qcalc brightnessctl wl-clipboard gammastep dunst curl wget grim slurp yt-dlp lf nemo ttf-jetbrains-mono-nerd noto-fonts-emoji pavucontrol blueman bluez bluez-utils mpv swayimg ffmpeg wf-recorder

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
sudo rm -rf yay

yay brave-bin 
yay autotiling
sudo pacman -Rns $(pacman -Qdtq)

sudo mkdir -p ~/Downloads
sudo mkdir -p ~/.config/dunst/
sudo mkdir -p ~/.config/foot/
sudo mkdir -p ~/.config/i3blocks/
sudo mkdir -p ~/.config/lf/
sudo mkdir -p ~/.config/mpv/
sudo mkdir -p ~/.config/nvim/
sudo mkdir -p ~/.config/sway/
sudo mkdir -p ~/.config/zathura/
sudo mkdir -p ~/.config/gtk-3.0/
sudo mkdir -p /usr/local/bin/Scripts/Battery/
sudo mkdir -p /usr/local/bin/Scripts/Bluetooth/
sudo mkdir -p /usr/local/bin/Scripts/Network/
sudo mkdir -p /usr/local/bin/Scripts/Sound/
sudo mkdir -p /usr/local/bin/Scripts/Tools/

sudo wget -P ~/Downloads https://upload.wikimedia.org/wikipedia/commons/4/4d/Ancient_Bristlecone_Pine_Forest%2C_United_States_%28Unsplash%29.jpg

sudo cp ~/dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
sudo cp ~/dotfiles/foot/foot.ini ~/.config/foot/foot.ini
sudo cp ~/dotfiles/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
sudo cp ~/dotfiles/i3blocks/config ~/.config/i3blocks/config
sudo cp ~/dotfiles/lf/colors ~/.config/lf/colors
sudo cp ~/dotfiles/lf/icons ~/.config/lf/icons
sudo cp ~/dotfiles/lf/lfrc ~/.config/lf/lfrc
sudo cp ~/dotfiles/mpv/input.conf ~/.config/mpv/input.conf
sudo cp ~/dotfiles/mpv/mpv.conf ~/.config/mpv/mpv.conf
sudo cp ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
sudo cp ~/dotfiles/scripts/Battery/battery.sh /usr/local/bin/Scripts/Battery/battery.sh
sudo cp ~/dotfiles/scripts/Bluetooth/blueauto.sh /usr/local/bin/Scripts/Bluetooth/blueauto.sh
sudo cp ~/dotfiles/scripts/Bluetooth/blueicon.sh /usr/local/bin/Scripts/Bluetooth/blueicon.sh
sudo cp ~/dotfiles/scripts/Bluetooth/blueoff.sh /usr/local/bin/Scripts/Bluetooth/blueoff.sh
sudo cp ~/dotfiles/scripts/Bluetooth/bluesearch.sh /usr/local/bin/Scripts/Bluetooth/bluesearch.sh
sudo cp ~/dotfiles/scripts/Network/essid.sh /usr/local/bin/Scripts/Network/essid.sh
sudo cp ~/dotfiles/scripts/Network/wifi-connect.sh /usr/local/bin/Scripts/Network/wifi-connect.sh
sudo cp ~/dotfiles/scripts/Sound/sound.sh /usr/local/bin/Scripts/Sound/sound.sh
sudo cp ~/dotfiles/scripts/Tools/brightness.sh /usr/local/bin/Scripts/Tools/brightness.sh
sudo cp ~/dotfiles/scripts/Tools/calc.sh /usr/local/bin/Scripts/Tools/calc.sh
sudo cp ~/dotfiles/scripts/Tools/date.sh /usr/local/bin/Scripts/Tools/date.sh
sudo cp ~/dotfiles/scripts/Tools/emoji /usr/local/bin/Scripts/Tools/emoji
sudo cp ~/dotfiles/scripts/Tools/emoji.sh /usr/local/bin/Scripts/Tools/emoji.sh
sudo cp ~/dotfiles/scripts/Tools/movie.sh /usr/local/bin/Scripts/Tools/movie.sh
sudo cp ~/dotfiles/scripts/Tools/power.sh /usr/local/bin/Scripts/Tools/power.sh
sudo cp ~/dotfiles/scripts/Tools/share.sh /usr/local/bin/Scripts/Tools/share.sh
sudo cp ~/dotfiles/scripts/Tools/tools.sh /usr/local/bin/Scripts/Tools/tools.sh
sudo cp ~/dotfiles/sway/config ~/.config/sway/config
sudo cp ~/dotfiles/zathura/zathurarc ~/.config/zathura/zathurarc
sudo cp ~/dotfiles/zsh/zshrc ~/.zshrc
sudo cp ~/dotfiles/mimeapps.list ~/.config/mimeapps.list
sudo cp ~/dotfiles/git/gitconfig ~/.config/.gitconfig
