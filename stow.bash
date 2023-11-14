#!/usr/bin/env bash

error="$(tput setaf 1)Error:$(tput sgr 0)"              # red error
succ="$(tput setaf 2)Success:$(tput sgr 0)"             # green success
warn="$(tput setaf 3)Warning:$(tput sgr 0)"             # yellow warning
info="$(tput setaf 4)Info:$(tput sgr 0)"                # blue info

declare -a dir2link
dir2link=(
  "alacritty/"
  "bash/"
  "eslint/"
  "fd/"
  "gitconfig/"
  "gtk/" # removes titlebars from apps like chrome
  "markdownlint/"
  "ideavim/"
  "readline/"
  "sgnvim/"
  "starship/"
  "tmux/"
  "vim/"
)

if [[ -x "$(command -v stow)" ]]; then
  echo "${info} Linking files with stow"
  stow --target="$HOME" -S "${dir2link[@]}" && echo "${succ} configuration stowed" || echo "${error} failed to stow configuration"
else
  echo "${warn} Stow not found"
  exit
fi
