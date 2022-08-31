#!/bin/bash
if [[ $UID != 0 ]]; then
    echo "Script must be run as sudo!"
    exit
fi

pkgs=(
    cmus
    gimp
    git
    neofetch
    neovim 
    qalc
    qemu
    ranger
    ruby
    setxkbmap
    scrot
    subversion
    tar
    testdisk
    texlive-base
    tree
    thunderbird
    which
    wireshark
    zathura
)
    
echo -n "${#pkgs[@]} Packages will be installed. Proceed? (y/N) "
read input

if [[ $input =~ ^Y$|^y$ ]]; then
    echo "Installing..."
    for pkg in $pkgs; do
	apt install $pkg -y
    done
    echo "Done!"
fi
