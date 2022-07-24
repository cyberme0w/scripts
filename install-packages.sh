#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Script must be run as sudo!"
    exit
fi

pkgs=(
    "firefox"
    "firefox-esr"
    "gimp"
    "zathura"
    "nvim"
    "zathura"
    "zathura-pdf-mupdf"
    "zathura-pdf-poppler"
    "zathura-ps"
    "cherrytree-future"
    "cmus"
    "yt-dlp"
    "xorg-x11-server-Xorg"
    "xorg-x11-xinit"
    "xrandr"
    "wireshark"
    "which"
    "virtualbox"
    "tree"
    "thunderbird"
    "texlive"
    "testdisk"
    "tar"
    "git"
    "setxkbmap"
    "scrot"
    "neofetch"
    "ruby"
    "ruby-devel"
    "ranger"
    "qalculate"
    "pdfmerge"
)

if [[ -n $(dnf) ]]; then
    cmd="dnf install -yq "
elif [[ -n $(apt) ]]; then
    cmd="apt install "
else
    echo "Neither APT nor DNF are available. Install your packages yourself."
    exit
fi

echo -n "${#pkgs[@]} Packages will be installed with $manager. Proceed? (y/N) "
read input

if [[ $input =~ ^Y$|^y$ ]]; then
    echo "Installing..."
    for pkg in ${pkgs[@]}; do
        echo -n " - $pkg ... "
        $cmd $pkg
        echo "Done"
    done
fi
