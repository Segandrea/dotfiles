#!/usr/bin/env bash

# Be ready for errors: '-e' end script in case of errors, '-u' print errors for undefined variables, '-o pipefail' avoid problems with pipes
set -euo pipefail

####################################
# Configs for installation scripts #
####################################

# Define colors for logging
if command -v tput >/dev/null 2>&1; then
    red="$(tput setaf 1)"
    green="$(tput setaf 2)"
    yellow="$(tput setaf 3)"
    blue="$(tput setaf 4)"
    reset="$(tput sgr 0)"
else
    red=''
    green=''
    yellow=''
    blue=''
    reset=''
fi

log_info() { echo -e "${blue}[Info]${reset} $*"; }
log_succ() { echo -e "${green}[Success]${reset} $*"; }
log_warn() { echo -e "${yellow}[Warning]${reset} $*"; }
log_err() { echo -e "${red}[Error]${reset} $*"; }

# Setup constants
hostname='hornet'
flathub_url='https://dl.flathub.org/repo/flathub.flatpakrepo'

####################
# Requisite Checks #
####################

# Check if running as sudo
if [[ $EUID -ne 0 ]]; then
  log_err "Run this script with sudo or as root"
  exit 1
fi

# Get the distro name
distro="$(grep '^ID=' /etc/os-release | sed 's/^ID=//')"

# Check if fedora, otherwise stop the script
source /etc/os-release
if [[ "${ID:-}" != "fedora" ]]; then
  log_err "This script is only for Fedora"
  exit 1
fi

############################
# Base for a decent Fedora #
############################

# Step 0: setup dnf by adding under [main] the fastest mirror, parallel downloads, default yes and keep cache
if ! grep -q '^fastestmirror=' /etc/dnf/dnf.conf; then
    sudo sed -i '/^\[main\]$/a\\nfastestmirror=True\\nmax_parallel_downloads=10\\ndefaultyes=True\\nkeepcache=True' /etc/dnf/dnf.conf
fi

# First things first: let's be up to date!
sudo dnf update -y

# Enabling rpmfusion free and nonfree for software and codecs not in the main repos and update
sudo dnf install "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf install "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf group upgrade core
sudo dnf group install core

# Installing codecs, full version of ffmpeg, gstreamer components, and sound and videos packages
sudo dnf group install multimedia
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group install -y sound-and-video

# H/W Video Accelleration
sudo dnf install ffmpeg-libs libva libva-utils
sudo dnf install mesa-va-drivers-freeworld      # AMD specific
sudo dnf install mesa-va-drivers-freeworld.i686 # AMD specific

# OpenH264 for Firefox
sudo dnf install -y openh264 gstreamer1-plugin-openh264 mozilla-openh264
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
log_info "Enable Firefox's plugin for Openh264 in Settings"
sleep 3

# Must change the hostname
hostnamectl set-hostname hornet

# Enable flathub
flatpak remote-add --if-not-exists flathub "${flathub_url}"

# AppImage support
sudo dnf install fuse-libs
flatpak install it.mijorus.gearlever

#####################
# Commandline tools #
#####################

# Enabling some copr
sudo dnf copr enable atim/starship
sudo dnf copr enable zeno/scrcpy

# Always update!
sudo dnf update -y

# Define the tools
declare -a commandline_tools=(
    bat
    calibre
    dconf 
    fd-find
    fzf
    git
    ncompress 
    neovim
    openssl
    p7zip-plugins
    rustup
    scrcpy
    starship
    stow
    tealdeer
    tmux
    unrar
    vim
    zoxide
)

# Install commandline tools
sudo dnf install "${commandline_tools[@]}"

############################
# Improve Gnome experience #
############################

# Always update!
sudo dnf update -y

# Define the packages
declare -a gnome_experience_pkgs=(
    gnome-shell-extension-pop-shell 
    gnome-shell-extension-screen-autorotate 
    gnome-tweaks
    lm_sensors
)

# Install gnome extensions and tweaks
sudo dnf install "${gnome_experience_pkgs[@]}"

# Define Gnome-related Flatpaks
declare -a gnome_flatpaks=(
    extensionmanager
    extensions
)

# Install Gnome-related Flatpaks
flatpak install "${gnome_flatpaks[@]}"

###############################
# Install normal applications #
###############################

# Enable terra repository (dnf repo community-mantained)
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# Define dnf applications to install
declare -a dnf_apps=(
    alacritty
    kitty
)

# Define flatpak applications to install
declare -a flatpak_apps=(
    androidstudio
    brave
    embellish
    flatseal
    intellij
    spotify
    stremio
    telegram
)

# Install from dnf
sudo dnf install "${dnf_apps[@]}"

# Install flatpaks
flatpak install "${flatpak_apps[@]}"

#################################
# Link directories with configs #
#################################

declare -a dir2link
dir2link=(
  "alacritty/"
  "autostart/"
  "bash/"
  "fd/"
  "gitconfig/"
  "gtk/" # removes titlebars from apps like chrome
  "nvim/"
  "ideavim/"
  "readline/"
  "scripts/"
  "starship/"
  "tmux/"
  "vim/"
)

# fonts
log_info "Nerd fonts can be installed with embellish"

if [[ -x "$(command -v stow)" ]]; then
  log_info "Linking files with stow"
  stow --target="$HOME" -S "${dir2link[@]}" && log_succ "configuration stowed" || log_err "failed to stow configuration"
else
  log_err "Stow not found"
  exit
fi
