#!/bin/bash

# ACTUALIZACIÓN
sudo apt update -y && sudo apt upgrade -y 2>/dev/null

# Variable Global
ruta=$(pwd)

# CREANDO DIRECTORIO DE DESCARGAS
mkdir bins

# INSTLACION DE DEPENDENCIAS BÁSICAS
sudo apt install -y kitty rofi feh xclip ranger i3lock-fancy scrot scrub wmname imagemagick cmatrix python3-pip procps tty-clock lsd pamixer flameshot
sudo apt install -y build-essential git vim libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev libuv1-dev

# PAQUETES (libjxl0.11) (PREVIO A LA POLYBAR)
wget -P ./bins http://ftp.es.debian.org/debian/pool/main/j/jpeg-xl/libjxl0.11_0.11.1-4_arm64.deb
sudo dpkg -i $ruta/bins/libjxl0.11_0.11.1-4_arm64.deb

# INSTLACIÓN DEPENDENCIAS POLYBAR
sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev

# INSTALACION PREVIA A PICOM (NECESARIA)
sudo apt install -y libjsoncpp26 libmpdclient2t64 libxcb-xrm0 libxcb-ewmh2
sudo apt install -y libevdev-doc

# INSTALACION POLYBAR
wget -P ./bins http://launchpadlibrarian.net/775625298/polybar_3.7.2-1_arm64.deb
sudo dpkg -i $ruta/bins/polybar_3.7.2-1_arm64.deb

# Dependencias de Picom
sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev

# INSTALL PICOM
sudo apt install picom

# INSTALL FASTFETCH
wget -P ./bins https://github.com/fastfetch-cli/fastfetch/releases/download/2.42.0/fastfetch-linux-aarch64.deb
sudo dpkg -i $ruta/bins/fastfetch-linux-aarch64.deb

# INSTALL BAT
wget -P ./bins https://github.com/sharkdp/bat/releases/download/v0.25.0/bat-musl_0.25.0_arm64.deb
sudo dpkg -i $ruta/bins/bat-musl_0.25.0_arm64.deb


# INSTALL BSPWM
sudo apt install -y bspwm

# INSTALL ROFI
sudo apt install -y rofi

# ROFI THEMES
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd $ruta/rofi/
chmod +x setup.sh
./setup.sh 2>/dev/null
cd $ruta


# INSTALL LSD
apt install lsd

# INSTALL BURPSUITE
apt install burpsuite

# INSTALL POWERSHELL
#sudo apt install pwsh

########

# Instalamos las HackNerdFonts

sudo cp -v $ruta/fonts/HNF/* /usr/local/share/fonts/

# Instalando Fuentes de Polybar

sudo cp -v $ruta/Config/polybar/fonts/* /usr/share/fonts/truetype/

# Instalando p10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Instalando p10k root

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k


sudo cp -v $ruta/fonts/HNF/* /usr/local/share/fonts/

# Instalando Wallpaper

mkdir ~/Wallpaper
cp -v $ruta/Wallpaper/* ~/Wallpaper
mkdir ~/ScreenShots

# Copiando Archivos de Configuración

rm -r ~/.config/polybar
cp -rv $ruta/Config/* ~/.config/
sudo cp -rv $ruta/kitty /opt/

# Copia de configuracion de .p10k.zsh y .zshrc

rm -rf ~/.zshrc
cp -v $ruta/.zshrc ~/.zshrc

cp -v $ruta/.p10k.zsh ~/.p10k.zsh
sudo cp -v $ruta/.p10k.zsh-root /root/.p10k.zsh

# Script

sudo cp -v $ruta/scripts/whichSystem.py /usr/local/bin/
sudo cp -v $ruta/scripts/screenshot /usr/local/bin/

# Plugins ZSH

sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions
sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# Cambiando de SHELL a zsh

cp -v $ruta/.zshrc ~/.zshrc
sudo ln -sfv ~/.zshrc /root/.zshrc
cp -v $ruta/.p10k.zsh ~/.p10k.zsh
sudo ln -sfv ~/.p10k.zsh /root/.p10k.zsh


# Asignamos Permisos a los Scritps

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bin/ethernet_status.sh
chmod +x ~/.config/bin/htb_status.sh
chmod +x ~/.config/bin/htb_target.sh
chmod +x ~/.config/polybar/launch.sh
sudo chmod +x /usr/local/bin/whichSystem.py
sudo chmod +x /usr/local/bin/screenshot

# INSTALL ZENITY
#sudo apt install zenity
