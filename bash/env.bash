#!/usr/bin/env bash

##
# environment configuration
#
# correct typos in directory names during cd
shopt -s cdspell
# correct typos in directory during autocompletion
shopt -s dirspell
# check and update the values of LINES and COLUMNS
shopt -s checkwinsize
# append to history
shopt -s histappend
# don't put duplicate lines or lines starting with space in history
export HISTCONTROL="ignoreboth"
# use .bash_history as file for storing history
export HISTFILE="$HOME/.bash_history"
# use less as pager
export PAGER="less"
# use vim as default editor
export EDITOR="nvim"
# use chrome as default browser
export BROWSER="google-chrome"
# nvm
export NVM_DIR="$HOME/.nvm"
# limits recursive functions, see 'man bash'
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

# my most used directories
export DOCUMENTS_DIR="$HOME/Documents"
export DOWNLOADS_DIR="$HOME/Downloads"
export DESKTOP_DIR="$HOME/Desktop"
export PICTURES_DIR="$HOME/Pictures"
export VIDEOS_DIR="$HOME/Videos"
export WORKSPACES_DIR="$HOME/Workspaces"
export DOTFILES_DIR="$WORKSPACES_DIR/dotfiles"
export IGNORAMUS_DIR="$WORKSPACES_DIR/ignoramus"
