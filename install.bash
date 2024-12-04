#!/usr/bin/env bash

error="$(tput setaf 1)Error:$(tput sgr 0)"              # red error
succ="$(tput setaf 2)Success:$(tput sgr 0)"             # green success
warn="$(tput setaf 3)Warning:$(tput sgr 0)"             # yellow warning
info="$(tput setaf 4)Info:$(tput sgr 0)"                # blue info

declare -a dir2link
dir2link=(
  "alacritty/"
  "autostart/"
  "bash/"
  "eslint/"
  "fd/"
  "gitconfig/"
  "gtk/" # removes titlebars from apps like chrome
  "markdownlint/"
  "nvim/"
  "ideavim/"
  "readline/"
  "scripts/"
  "starship/"
  "tmux/"
  "vim/"
)

# Enabling some copr
sudo dnf copr enable atim/starship
# Installing packages with dnf
dnf_packages='alacritty calibre dconf fd-find fzf git gnome-shell-extension-pop-shell kitty ncompress neovim p7zip-plugins rustup starship stow tealdeer tmux unrar vim zoxide'
sudo dnf install "${dnf_packages}"
# Installing packages with flatpak NB. if it doesn't work make an array from the variable and cycle through it
flatpak_packages='androidstudio brave embellish extensionmanager extensions flatseal intellij spotify telegram'
sudo flatpak install "${flatpak_packages}"
# fonts
echo "${info} Nerd fonts can be installed with embellish"

if [[ -x "$(command -v stow)" ]]; then
  echo "${info} Linking files with stow"
  stow --target="$HOME" -S "${dir2link[@]}" && echo "${succ} configuration stowed" || echo "${error} failed to stow configuration"
else
  echo "${warn} Stow not found"
  exit
fi
