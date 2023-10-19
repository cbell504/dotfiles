#!/bin/bash
#
# This is a quick start guide to setting up a machine

readonly BREW_CONFIG_CLEAN="Updating, Upgrading, and Cleaning up Brew...\n"
readonly PACKAGES_INSTALL="Installing common packages...\n"
readonly PACKAGES_INSTALL_CASK="Installing MacOS Brew Cask Packages...\n"
readonly INSTALL_PROMPT="Installing the following packages...\n"
readonly INSTALL_PROMPT_MACOS="Installing the following HomeBrew Packages...\n"

# Brew packages to pick up
readonly PACKAGES=(
"appcleaner"
"coconutbattery"
"cowsay"
"curl"
"findutils"
"gcc"
#"gdb"
#"gifcapture"
#"gimp"
"git"
"htop"
"insomnia"
"lua"
"maven"
# "mongodb"
"mgba"
#"mpv"
"neofetch"
"neovim"
"node"
"omnidisksweeper"
#"openjdk-11-jdk"
"ponysay"
"python3"
"ripgrep"
"tree"
"tmux"
"vitetris"
"youtube-dl"
"zsh-completions"
)

# Array of git repos I wanted local
readonly GIT=(
    "https://github.com/robbyrussell/oh-my-zsh.git"
)

# Project folder to save all repos
readonly PROJECT_FOLDER="~/Development/"

# Name of current OS
readonly SYSTEM_NAME=`uname`


# Updates brew, upgrades current packages, and cleans up system
function brew_configs() {
    echo $BREW_CONFIG_CLEAN
    brew update
    brew upgrade
    brew cleanup
}

# Checks to see if the Project folder exist
function create_project_folder() {
if [[ ! -d "$PROJECT_FOLDER" ]]; then
    mkdir $PROJECT_FOLDER
fi
}

# Installs all listed packages for MacOS
function install_macos_packages() {
    echo "macos\n"
    for item in ${PACKAGES[@]}
    do
        brew install $item
    done
}

# List all packages to be installed
function list_packages() {
    echo $INSTALL_PROMPT
    for item in ${PACKAGES[@]}
    do
        echo $item
    done
    echo "\n"
    if [[ "$SYSTEM_NAME" == 'Darwin' ]]; then
        echo $INSTALL_PROMPT_MACOS

        for item in ${PACKAGES_BREW[@]}
        do
            echo $item
        done
    fi
    echo "\n"
}

list_packages
brew_configs
install_macos_packages
