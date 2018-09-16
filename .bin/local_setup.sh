#!/bin/bash

# Common packages on any nix system
common=(
"ponysay"
"cowsay"
"neovim"
"neofetch"
"tmux"
"lynx"
"cmus"
"zsh"
"git"
"python3"
"gcc"
)

# Array of packages for debian based linux
apt=()

# Array of packages for brew on macOS
brew=()

# Array of git repos I wanted local
git=(
"https://github.com/robbyrussell/oh-my-zsh.git"
"https://github.com/ubuntuphp/cute-browser.git"
)

# Project folder to save all repos
project_folder="~/Documents/projects"


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


# Checks to see if the Project folder exist
if [[ ! -d "$project_folder" ]]; then
    mkdir $project_folder
fi


