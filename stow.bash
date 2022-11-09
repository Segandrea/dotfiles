#!/usr/bin/env bash

error="$(tput setaf 1)Error:$(tput sgr 0)"              # red error
succ="$(tput setaf 2)Success:$(tput sgr 0)"             # green success
warn="$(tput setaf 3)Warning:$(tput sgr 0)"             # yellow warning
info="$(tput setaf 4)Info:$(tput sgr 0)"                # blue info

if [[ -x "$(command -v stow)" ]]; then
  echo "${info} Linking files with stow"
  stow --target="$HOME" -S alacritty/ bash/ fonts/ sgnvim/ starship/ tmux/ vim/ && echo "${succ} configuration stowed" || echo "${error} failed to stow configuration"
else
  echo "${error} Stow not found"
  exit
fi