#!/usr/bin/env bash

set -euo pipefail

readonly BREW_CONFIG_CLEAN="Updating, Upgrading, and Cleaning up Brew..."
readonly GIT_REPOS=(
	"https://github.com/robbyrussell/oh-my-zsh.git"
)
readonly INSTALLING_FORMULAE="Installing Homebrew formulae..."
readonly INSTALLING_CASKS="Installing Homebrew casks..."
readonly PROJECT_FOLDER="$HOME/Developer/"
readonly SYSTEM_NAME="$(uname)"

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

function ensure_brew() {
  if ! command -v brew &>/dev/null; then
    read -rp "Homebrew not found. Install it? (y/n): " ans
    [[ "$ans" == "y" ]] || { echo "brew required. exiting."; exit 1; }
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv || true)"
  fi
}

function setup_brewfile() {
  echo "Installing from Brewfile..."
  if [[ ! -f ./Brewfile ]]; then
    echo "Brewfile not found!"
    exit 1
  fi
  brew bundle --file=./Brewfile
  brew cleanup
}

function create_project_folder() {
    if [[ ! -d "$PROJECT_FOLDER" ]]; then
        mkdir -p "$PROJECT_FOLDER"
        echo "Created project folder at $PROJECT_FOLDER"
    fi
}


function clone_repos() {
    create_project_folder
    cd "$PROJECT_FOLDER" || exit 1
    for repo in "${GIT_REPOS[@]}"; do
        git clone "$repo"
    done
}

function clone_repos() {
	if [[ ! -d "$PROJECT_FOLDER" ]]; then
  mkdir -p "$PROJECT_FOLDER"
	fi
  cd "$PROJECT_FOLDER"
  for repo in "${GIT_REPOS[@]}"; do
    dir=$(basename "$repo" .git)
    if [[ ! -d "$dir" ]]; then
      git clone "$repo"
    else
      echo "Repo $dir already exists, skipping."
    fi
  done
}

function main() {
  [[ "$SYSTEM_NAME" == "Darwin" ]] || { echo "only macOS supported right now"; exit 1; }
  check_homebrew_installed
  # ensure_brew
  setup_brewfile
  clone_repos
  echo "setup done 🎉"
}

main
