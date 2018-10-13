#!/bin/bash

brew tap cask


brew update

brew upgrade --all

apps=(
	appcleaner
    coconutbattery
	cowsay
	curl
	findutils
	gdb
	gfxcardstatus
	git
	go
	grep
	htop
	iterms
	neofetch
	maven
	mpv
	node
	nvim
	ponysay
	python
	python3
	smcfancontrol
	tree
	vlc
	wget
	youtube-dl
	zsh
	zsh-completions
)

brew install "${apps[@]}"

brew cleanup
