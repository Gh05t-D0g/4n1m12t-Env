#!/bin/bash

ruta=$(pwd)

opciones()
{
    zenity --list --title="Selecciona una opción" --column="Elige una opción: " "$@"
}

Pacman_theme()
{
	#Damos permisos de ejecución 
	sudo chmod +x $ruta/Themes/Pacman/.p10k.zsh
	sudo chmod +x $ruta/Themes/Pacman/.p10k.zsh-root
	sudo chmod +x $ruta/Themes/Pacman/Config/bspwm/bspwmrc 
    sudo chmod +x $ruta/Themes/Pacman/Config/bspwm/scripts/bspwm_resize 
    sudo chmod +x $ruta/Themes/Pacman/Config/bin/ethernet_status.sh
    sudo chmod +x $ruta/Themes/Pacman/Config/bin/htb_status.sh 
    sudo chmod +x $ruta/Themes/Pacman/Config/bin/htb_target.sh 
    sudo chmod +x $ruta/Themes/Pacman/Config/polybar/launch.sh 
    sudo chmod +x /usr/local/bin/whichSystem.py 
    sudo chmod +x /usr/local/bin/screenshot 
	#Limpiamos viejos dot files
	sudo rm -rf	~/.p10k.zsh
	sudo rm -rf	/root/.p10k.zsh
	sudo rm -rf ~/.config/bspwm
	sudo rm -rf ~/.config/bin
	sudo rm -rf ~/.config/picom
	sudo rm -rf ~/.config/polybar
	sudo rm -rf ~/.config/rofi
	sudo rm -rf ~/.config/Wallpaper
	#Movemos los dot files
	sudo cp -v $ruta/cinn2.jpg ~/Wallpaper/
    sudo cp -v $ruta/Themes/Pacman/.p10k.zsh ~/.p10k.zsh
    sudo cp -v $ruta/Themes/Pacman/.p10k.zsh-root /root/.p10k.zsh
    echo "p10k setup"
	sudo cp -rv $ruta/Themes/Pacman/Config/* ~/.config/
	echo "config setup"
    rofi-theme-selector
    echo "Pacman theme instalado"
    kill -9 -1
}

selected_option=$(opciones "Pacman")


case "$selected_option" in
    "Pacman")
        Pacman_theme
        ;;

    *)
        echo "Selección inválida."
        ;;
esac
