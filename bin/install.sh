#!/usr/bin/env bash

set -euo pipefail

#=========================================
# Constants
#=========================================
readonly BREW_CONFIG_CLEAN="Updating, Upgrading, and Cleaning up Brew..."
readonly INSTALLING_FORMULAE="Installing Homebrew formulae..."
readonly INSTALLING_CASKS="Installing Homebrew casks..."
readonly PROJECT_FOLDER="$HOME/Development/"
readonly SYSTEM_NAME="$(uname)"


#=========================================
# Package Arrays
#=========================================
# Homebrew formula packages
FORMULAE=(
    "curl"
    "fastfetch"
    "findutils"
    "gcc"
    "git"
    "htop"
    "lua"
    "maven"
    "mongodb/brew/mongodb-community@6.0" # Example for taps
    "neovim"
    "node"
    "pgadmin4"
    "ponysay"
    "postgresql@14"
    "postgresql@16"
    "python@3.11" # specify a version if desired
    "ripgrep"
    "tmux"
    "tree"
    "vitetris"
    "youtube-dl"
    "zsh-completions"
)

# Homebrew cask packages
CASKS=(
    "appcleaner"
    "coconutbattery"
    "discord"
    "gifcapture"
    "handbrake"
    "insomnia"
    "mgba"
    "omnidisksweeper"
    "transmission"
    "visual-studio-code"
    "vlc"
)

# Git repositories to clone
GIT_REPOS=(
    "https://github.com/robbyrussell/oh-my-zsh.git"
)


#=========================================
# Functions
#=========================================

function check_homebrew_installed() {
    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Would you like to install it now? (y/n)"
        read -r answer
        if [[ "$answer" == "y" ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            # After install, ensure brew is on PATH. On Apple Silicon, brew installs to /opt/homebrew.
            eval "$(/opt/homebrew/bin/brew shellenv || true)"
        else
            echo "Homebrew required. Exiting."
            exit 1
        fi
    fi
}

function brew_configs() {
    printf "%s\n" "$BREW_CONFIG_CLEAN"
    brew update
    brew upgrade
    brew cleanup
}

function create_project_folder() {
    if [[ ! -d "$PROJECT_FOLDER" ]]; then
        mkdir -p "$PROJECT_FOLDER"
        echo "Created project folder at $PROJECT_FOLDER"
    fi
}

function install_formulae() {
    printf "%s\n" "$INSTALLING_FORMULAE"
    for formula in "${FORMULAE[@]}"; do
        brew install "$formula" || {
            echo "Failed to install $formula"
            exit 1
        }
    done
}

function install_casks() {
    printf "%s\n" "$INSTALLING_CASKS"
    for cask in "${CASKS[@]}"; do
        brew install --cask "$cask" || {
            echo "Failed to install cask $cask"
            exit 1
        }
    done
}

function clone_repos() {
    create_project_folder
    cd "$PROJECT_FOLDER" || exit 1
    for repo in "${GIT_REPOS[@]}"; do
        git clone "$repo"
    done
}

function list_packages() {
    echo "The following Homebrew formulae will be installed:"
    for formula in "${FORMULAE[@]}"; do
        echo " - $formula"
    done
    echo

    echo "The following Homebrew casks will be installed:"
    for cask in "${CASKS[@]}"; do
        echo " - $cask"
    done
    echo
}


#=========================================
# Main Script Execution
#=========================================
if [[ "$SYSTEM_NAME" == "Darwin" ]]; then
    # Only run on macOS
    check_homebrew_installed
    list_packages
    brew_configs
    install_formulae
    install_casks
    clone_repos
    echo "Setup complete!"
else
    echo "This script is designed for macOS (Darwin). Exiting."
    exit 1
fi
