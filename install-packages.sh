#!/bin/bash
if [[ $UID != 0 ]]; then
    echo "Script must be run as sudo!"
    exit
fi

echo -n "These packages are supposed to be installed on top of a Debian minimal installation. Proceed? (y/N) "
read $yn
if [[ $yn =~ y|Y ]]; then
    pkgs=""
    pkgs=$pkgs"cmus "
    pkgs=$pkgs"gimp "
    pkgs=$pkgs"git "
    pkgs=$pkgs"neofetch "
    pkgs=$pkgs"neovim "
    pkgs=$pkgs"qalc "
    pkgs=$pkgs"qemu "
    pkgs=$pkgs"ranger "
    pkgs=$pkgs"ruby "
    pkgs=$pkgs"setxkbmap "
    pkgs=$pkgs"scrot "
    pkgs=$pkgs"subversion "
    pkgs=$pkgs"tar "
    pkgs=$pkgs"testdisk "
    pkgs=$pkgs"texlive-base "
    pkgs=$pkgs"tree "
    pkgs=$pkgs"thunderbird "
    pkgs=$pkgs"which "
    pkgs=$pkgs"wireshark "
    pkgs=$pkgs"xrandr "
    pkgs=$pkgs"zathura "
    
    echo -n "${#pkgs[@]} Packages will be installed. Proceed? (y/N) "
    read input

    if [[ $input =~ ^Y$|^y$ ]]; then
    echo "Installing..."
    apt install $pkgs
    echo "Done!"
fi
