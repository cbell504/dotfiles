#!/bin/bash

brew tap cask


brew update

brew upgrade --all

apps=(
	cowsay
	curl
	findutils
	gdb
	git
	go
	grep
	htop
	iterms
	neofetch
	macs-fan-control
	maven
	mpv
	node
	nvim
	ponysay
	python
	python3
	tree
	vlc
	wget
	youtube-dl
	zsh
	zsh-completions
)

brew install "${apps[@]}"

brew cleanup
