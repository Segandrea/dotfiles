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
workspaces_dir="${HOME}/Workspaces"
dotfiles_dir="${workspaces_dir}/dotfiles"

####################
# Requisite Checks #
####################

# Check if fedora, otherwise stop the script
source /etc/os-release
if [[ "${ID:-}" != "fedora" ]]; then
    log_err "This script is only for Fedora."
    exit 1
fi

############################
# Base for a decent Fedora #
############################

log_info "Optimizing dnf configuration..."

# Step 0: setup dnf (/etc/dnf/dnf.conf should contain a [main] but check anyway) the fastest mirror, parallel downloads, default yes and keep cache
if ! grep -q '^\[main\]' /etc/dnf/dnf.conf; then
    echo '[main]' | sudo tee -a /etc/dnf/dnf.conf
fi

if ! grep -q '^fastestmirror=' /etc/dnf/dnf.conf; then
    echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
    echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
    echo 'defaultyes=True' | sudo tee -a /etc/dnf/dnf.conf
    echo 'keepcache=True' | sudo tee -a /etc/dnf/dnf.conf
fi

# First things first: let's be up to date!
sudo dnf update -y

log_info "Enabling rpmfusion free and nonfree and installing basic media tools..."

# Enabling rpmfusion free and nonfree for software and codecs not in the main repos and update
sudo dnf install -y "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf install -y "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf group upgrade -y core
sudo dnf group install -y core

# Installing codecs, full version of ffmpeg, gstreamer components, and sound and videos packages
sudo dnf group install -y multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf group install -y sound-and-video

# H/W Video Accelleration
sudo dnf install -y ffmpeg-libs libva libva-utils
sudo dnf install -y mesa-va-drivers-freeworld      # AMD specific
sudo dnf install -y mesa-va-drivers-freeworld.i686 # AMD specific

# OpenH264 for Firefox
sudo dnf install -y openh264 gstreamer1-plugin-openh264 mozilla-openh264
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
log_info "Enable Firefox's plugin for Openh264 in Settings."
sleep 3

# Must change the hostname
log_info "Changing hostname in '${hostname}'."
sudo hostnamectl set-hostname "${hostname}"

log_info "Adding flathub remote to flatpak and installing basic tools to manage appimages..."

# Enable flathub
flatpak remote-add --if-not-exists flathub "${flathub_url}"

# AppImage support
sudo dnf install -y fuse-libs
flatpak install -y --noninteractive flathub it.mijorus.gearlever

#####################
# Commandline tools #
#####################

log_info "Adding coprs for secodary tools..."

# Enabling some copr
sudo dnf copr enable -y atim/starship
sudo dnf copr enable -y zeno/scrcpy

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
    scrcpy
    starship
    stow
    tealdeer
    tmux
    unrar
    vim
    zoxide
)

log_info "Installing useful commandline tools..."

# Install commandline tools
sudo dnf install -y "${commandline_tools[@]}"

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

log_info "Installing gnome shell extensions and tools..."

# Install gnome extensions and tweaks
sudo dnf install -y "${gnome_experience_pkgs[@]}"

# Define Gnome-related Flatpaks
declare -a gnome_flatpaks=(
    com.mattjakeman.ExtensionManager
    org.gnome.Extensions
)

# Install Gnome-related Flatpaks
flatpak install -y --noninteractive flathub "${gnome_flatpaks[@]}"

###############################
# Install normal applications #
###############################

# Enable terra repository (dnf repo community-mantained)
if ! rpm -q terra-release >/dev/null 2>&1; then
    sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
fi

log_info "Installing rust toolchain..."

# Install rustup if not installed and enable it
if ! command -v rustup >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
fi

# Define dnf applications to install
declare -a dnf_apps=(
    alacritty
    kitty
)

# Define flatpak applications to install
declare -a flatpak_apps=(
    com.google.AndroidStudio
    com.brave.Browser
    io.github.getnf.embellish
    com.github.tchx84.Flatseal
    com.jetbrains.IntelliJ-IDEA-Community
    com.spotify.Client
    com.stremio.Stremio
    org.telegram.desktop
)

log_info "Installing basic applications..."

# Install from dnf
sudo dnf install -y "${dnf_apps[@]}"

# Install flatpaks
flatpak install -y --noninteractive flathub "${flatpak_apps[@]}"

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
log_info "Nerd fonts can be installed with embellish."

# create a the workspaces directory
if [[ ! -d "${workspaces_dir}" ]]; then
    mkdir -p "${workspaces_dir}"
fi

log_info "Cloning dotfiles repository..."
# git clone repository before stowing the directories
if [[ ! -d "${dotfiles_dir}" ]]; then
    #git clone git@github.com:Segandrea/dotfiles.git "${dotfiles_dir}"
    git clone https://github.com/Segandrea/dotfiles.git "${dotfiles_dir}"
fi
cd "${dotfiles_dir}"

log_info "Stowing configuration files..."
log_info "Checking repository status..."
if [[ -n "$(git status --porcelain)" ]]; then
    log_err "Repository has pending changes, aborting stow tricks."
    exit
fi

# link configurations in the correct places
if command -v stow >/dev/null 2>&1; then
    log_info "Linking files with stow..."
    stow --target="$HOME" -S "${dir2link[@]}" --adopt && log_succ "Configuration stowed with the adoption of existing files."
    git reset --hard
    log_succ "Repository reset to replace the adopted files with the original ones."
else
    log_err "Stow not found."
    exit
fi

log_info "Configuring Gnome..."
# restore gnome configuration
if command -v dconf >/dev/null 2>&1; then
    dconf load / < "${dotfiles_dir}/settings.ini"
    log_succ "Gnome settings loaded."
else
    log_err "Gnome settings configuration failed."
fi

log_succ "Installation compleated"
log_info "Remember to install secrets like ssh keys"
