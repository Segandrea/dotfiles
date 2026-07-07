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
log_succ() { echo -e "${green}[Success]${reset} $*"; sleep 3; }
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

    log_succ "Dnf configuration optimized"
fi

# First things first: let's be up to date!
sudo dnf update -y -q && log_succ "DNF update completed."

log_info "Enabling rpmfusion free and nonfree and installing basic media tools..."

# Enabling rpmfusion free and nonfree for software and codecs not in the main repos and update
sudo dnf install -y -q "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" && log_succ "RPMfusion free added"
sudo dnf install -y -q "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" && log_succ "RPMfusion nonfree added"
sudo dnf group upgrade -y -q core && log_succ "Core group updated."
sudo dnf group install -y -q core && log_succ "Core group installed."

# Installing codecs, full version of ffmpeg, gstreamer components, and sound and videos packages
sudo dnf group install -y -q multimedia && log_succ "Multimedia group installed."
sudo dnf swap -y -q ffmpeg-free ffmpeg --allowerasing && log_succ "Installed complete ffmpeg."
sudo dnf group install -y -q sound-and-video && log_succ "Sound-and-vieo group installed."

# H/W Video Accelleration
sudo dnf install -y -q ffmpeg-libs libva libva-utils && log_succ "Installed ffmpeg-libs, libva and libva-utils."
sudo dnf install -y -q mesa-va-drivers-freeworld && log_succ "Installed mesa-va-drivers-freeworld."              # AMD specific
sudo dnf install -y -q mesa-va-drivers-freeworld.i686 && log_succ "Installed mesa-va-drivers-freeworld.i686."    # AMD specific

# OpenH264 for Firefox
sudo dnf install -y -q openh264 gstreamer1-plugin-openh264 mozilla-openh264 && log_succ "Installed openh264."
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1 && log_succ "Configuration: fedora-cisco-openh264.enabled=1."
log_info "Enable Firefox's plugin for Openh264 in Settings."
sleep 3

# Must change the hostname
log_info "Changing hostname in '${hostname}'."
sudo hostnamectl set-hostname "${hostname}" && log_succ "Hostname updated"

log_info "Adding flathub remote to flatpak and installing basic tools to manage appimages..."

# Enable flathub
flatpak remote-add --if-not-exists flathub "${flathub_url}" && log_succ "Added flathub remote."

# AppImage support
sudo dnf install -y -q fuse-libs && log_succ "Installed fuse-libs."
flatpak install -y --noninteractive flathub it.mijorus.gearlever && log_succ "Installed gearlever to manage appimages."

#####################
# Commandline tools #
#####################

log_info "Adding coprs for secodary tools..."

# Enabling some copr
sudo dnf copr enable -y -q atim/starship && log_succ "Added starship's copr."
sudo dnf copr enable -y -q zeno/scrcpy && log_succ "Added scrcpy's copr."
sudo dnf copr enable -y -q yalter/niri && log_succ "Added niri's copr."
sudo dnf copr enable -y -q lionheartp/Hyprland && log_succ "Added noctalia/hyprland's copr."

# Always update!
sudo dnf update -y -q && log_succ "DNF update copleted."

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
sudo dnf install -y -q "${commandline_tools[@]}" && log_succ "Installed commandline tools"

############################
# Improve Gnome experience #
############################

# Always update!
sudo dnf update -y -q && log_succ "DNF update completed."

# Define the packages
declare -a gnome_experience_pkgs=(
    gnome-shell-extension-appindicator
    gnome-shell-extension-freon
    gnome-shell-extension-just-perfection
    gnome-shell-extension-pop-shell
    gnome-shell-extension-screen-autorotate
    gnome-tweaks
    lm_sensors
)

log_info "Installing gnome shell extensions and tools..."

# Install gnome extensions and tweaks
sudo dnf install -y -q "${gnome_experience_pkgs[@]}" && log_succ "Installed gnome related packages."

# Define Gnome-related Flatpaks
declare -a gnome_flatpaks=(
    com.mattjakeman.ExtensionManager
    org.gnome.Extensions
)

# Install Gnome-related Flatpaks
flatpak install -y --noninteractive flathub "${gnome_flatpaks[@]}" && log_succ "Installed gnome related flatpaks."

###############################
# Install normal applications #
###############################

# Enable terra repository (dnf repo community-mantained)
if ! rpm -q terra-release >/dev/null 2>&1; then
    sudo dnf install -y -q --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release && log_succ "Added terra repo."
fi

log_info "Installing rust toolchain..."

# Install rustup if not installed and enable it
if ! command -v rustup >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Define dnf applications to install
declare -a dnf_apps=(
    alacritty
    kitty
    niri
    noctalia-git
)

# Define flatpak applications to install
declare -a flatpak_apps=(
    com.brave.Browser
    io.github.getnf.embellish
    com.github.tchx84.Flatseal
    com.spotify.Client
    com.stremio.Stremio
    org.telegram.desktop
)

log_info "Installing basic applications..."

# Install from dnf
sudo dnf install -y -q "${dnf_apps[@]}" && log_succ "Installed dnf packaged applications."

# Install flatpaks
flatpak install -y --noninteractive flathub "${flatpak_apps[@]}" && log_succ "Installed flatpak packaged applications."

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

# create a the workspaces directory
if [[ ! -d "${workspaces_dir}" ]]; then
    mkdir -p "${workspaces_dir}"
fi

log_info "Cloning dotfiles repository..."
# git clone repository before stowing the directories
if [[ ! -d "${dotfiles_dir}" ]]; then
    git clone https://github.com/Segandrea/dotfiles.git "${dotfiles_dir}" && log_succ "Dotfiles repository cloned."
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
    dconf load / < "${dotfiles_dir}/settings.ini" && log_succ "Gnome settings loaded."
else
    log_err "Gnome settings configuration failed."
fi

log_succ "Installation compleated!"
log_info "1. Remember to install secrets like ssh keys "
log_info "2. Remember to chmod 600 '~/.ssh/private_key' and chmod 644 '~/.ssh/public_key.pub'"
log_info "3. Remember to cd ${dotfiles_dir}; git remote set-url origin 'git@github.com:Segandrea/dotfiles.git'"
log_info "4. Remember to install 'Hasklug', Nerdfonts can be installed with embellish."
log_info "5. Remember to install 'Toolbox'(jetbrains.com/toolbox-app/) and all the ides that you need"
