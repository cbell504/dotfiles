#!/bin/bash

# Common packages on any nix system
common=("ponysay"
"cowsay"
"neovim"
"neofetch"
"tmux"
"lynx"
"cmus")

# Array of packages for debian based linux
apt=()

# Array of packages for brew on macOS
brew=()


# List packages
for item in ${common[@]}
do
    echo $item
done


unamestr=`uname`
echo $unamestr

if [[ "$unamestr" == 'Linux' ]]; then
    echo 'Linux'
    for item in ${common[@]}
    do
        sudo apt install $item
    done
else
    echo "macOS"
    for item in ${common[@]}
    do
        sudo brew install $item
    done
fi




