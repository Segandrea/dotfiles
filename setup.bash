#!/usr/bin/env bash
# vim: foldmethod=marker

set -e

# 0. needed vars declaration and definition {{{
dotpath="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" # path of this script directory
error="$(tput setaf 1)Error:$(tput sgr 0)"              # red error
succ="$(tput setaf 2)Success:$(tput sgr 0)"             # green success
warn="$(tput setaf 3)Warning:$(tput sgr 0)"             # yellow warning
info="$(tput setaf 4)Info:$(tput sgr 0)"                # blue info
# pacman packages
declare -a pacman_packages=(
    "alacritty"
    "bzip2"
    "curl"
    "flatpak"
    "git"
    "gzip"
    "neovim"
    "p7zip"
    "rustup"
    "tmux"
    "unrar"
    "vim"
    "wget"
    "wl-clipboard"
)
# aur packages
declare -a aur_packages=(
    "chrome-gnome-shell"
    "dracula-cursors-git"
    "dracula-gtk-theme"
    "dracula-icons-git"
    "gnome-shell-extension-gtktitlebar-git"
    "gnome-shell-extension-pop-shell-bin"
    "gnome-shell-extension-simple-net-speed"
    "gnome-shell-extension-vertical-overview-git"
    "gnome-shell-extension-workspaces-bar-git"
    "otf-hasklig"
    "snapd"
    "timeshift"
    "timeshift-autosnap"
    "ulauncher"
)
# snap packages
declare -a snap_packages=(
    "starship"
    "telegram-desktop"
    "spotify"
)
# flatpak packages
declare -a flatpak_packages=()
# }}}

# 1. set up git {{{
git_setup(){
    local res
    read -r -p "${info} Setup git? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Git configuration skipped."
        ;;
        *)
            local email
            read -r -p "Add your email: " email
            git config --global user.email "${email}"

            local username
            read -r -p "Add your username: " username
            git config --global user.name "${username}"

            local editor
            read -r -p "Add your editor of choice: " editor
            git config --global core.editor "${editor}"

            git config --global init.defaultBranch "main"
            echo "${succ} Setting up git: done."
        ;;
    esac
}
# }}}

# 2. install pacman packages {{{
pacman_install(){
    local res
    read -r -p "${info} Do you want to install official packages? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Official packages installation skipped."
            ;;
        *)
            if [[ -x "$(command -v pacman)" ]]; then
                sudo pacman -Syu
                sudo pacman -S --needed "${pacman_packages[@]}"
                echo "${succ} Official packages installed."
            else
                echo "${error} Pacman not found."
                exit
            fi
            ;;
    esac
}
# }}}

# 3.1 rustup {{{
rustup_setup(){
    local res
    read -r -p "${info} Do you want to install rust packages? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Rust packages installation skipped."
            ;;
        *)
            # checking if rust is installed with rustup, strongly recommended.
            if [[ -x "$(command -v rustup)" ]]; then
                rustup default stable
            else
                echo "${warn} Rustup not found, skipping."
                return
            fi

            # using cargo to install crates
            if [[ -x "$(command -v cargo)" ]]; then
                # cargo install ...
                echo "${warn} No crates to install."
            else
                echo "${error} Cargo not found"
                exit
            fi
            ;;
    esac
}
# }}}

# 4. install aur packages {{{
aur_install(){
    local res
    read -r -p "${info} Do you want to install aur packages? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Aur packages installation skipped."
            ;;
        *)
            if [[ -x "$(command -v yay)" ]]; then
                yay -Syu
                yay -S --needed --norebuild "${aur_packages[@]}"
                echo "${succ} Aur packages installed."
            elif [[ -x "$(command -v paru)" ]]; then
                paru -Syu
                paru -S --needed --norebuild "${aur_packages[@]}"
                echo "${succ} Aur packages installed."
            else
                echo "${error} Aur helper not found."
                exit
            fi
            ;;
    esac
}
# }}}

# 5. enable snap {{{
snap_setup(){
    local res
    read -r -p "${info} Do you want to enable snapd? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Enabling snapd skipped."
            ;;
        *)
            if [[ -x "$(command -v snap)" ]]; then
                sudo systemctl enable --now snapd.socket
                sudo ln -sf /var/lib/snapd/snap /snap
                echo "${info} Enabling snap..."
                sleep 5
                sudo snap install hello-world
                sudo snap remove hello-world
                echo "${succ} Snapd successfully enabled."
            else
                echo "${error} Snap not found."
                exit
            fi
            ;;
    esac
    # ask to reboot
    reboot_system
}
# }}}

# 6. enable flatpak {{{
flatpak_setup(){
    local res
    read -r -p "${info} Do you want to enable flatpak? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Enabling flatpak skipped."
            ;;
        *)
            if [[ -x "$(command -v snap)" ]]; then
                echo "${info} Enabling flatpak..."
                flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
                echo "${succ} Snapd successfully enabled."
            else
                echo "${error} Flatpak not found."
                exit
            fi
            ;;
    esac
    # ask to reboot
    reboot_system
}
# }}}

# 7. install git repos {{{
git_install(){
    local res
    read -r -p "${info} Install git repos? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Git repos installation skipped."
        ;;
        *)
            # tmux plugin manager
            if [[ ! -d "${dotpath}/.tmux/plugins/tpm" ]]; then
                git clone https://github.com/tmux-plugins/tpm "${dotpath}/.tmux/plugins/tpm"
                echo "${info} Remember to launch tmux and run prefix+I to install plugins."
            fi
            echo "${succ} Git repos installed."
        ;;
    esac
}
# }}}

# 8. link configs {{{
link_configs(){
    echo "${info} Linking configs..."

    # linking bash related files
    ln -sf "${dotpath}/.bashrc" "$HOME"
    ln -sf "${dotpath}/.aliases.bash" "$HOME"
    ln -sf "${dotpath}/.functions.bash" "$HOME"
    ln -sf "${dotpath}/.inputrc" "$HOME"
    # linking tmux configuration
    ln -sf "${dotpath}/.tmux" "$HOME"
    ln -sf "${dotpath}/.tmux.conf" "$HOME"
    # linking basic vim configuration
    ln -sf "${dotpath}/.vimrc" "$HOME"
    # linking starship configuration
    ln -sf "${dotpath}/starship.toml" "$HOME/.config"
    # linking alacritty configuration
    ln -sf "${dotpath}/alacritty" "$HOME/.config"

    echo "${succ} Configurations linked."
}
# }}}

# 9. install snap packages {{{
snap_install(){
    local res
    read -r -p "${info} Do you want to install snap packages? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Installation of snap packages skipped."
        ;;
        *)
            if [[ ! -x "$(command -v snap)" ]]; then
                echo "${error} snap is not installed."
                exit
            fi
            sudo snap install "${snap_packages[@]}"
            #sudo snap install --classic "${snap_classic_packages}
        ;;
    esac
}
# }}}

# 10. install flatpak packages {{{
flatpak_install(){
    local res
    read -r -p "${info} Do you want to install flatpak packages? [Y/n] " res
    case "${res}" in
        [nN][oO]|[nN])
            echo "${warn} Installation of flatpak packages skipped."
        ;;
        *)
            if [[ ! -x "$(command -v flatpak)" ]]; then
                echo "${error} flatpak is not installed."
                exit
            fi
            sudo flatpak install "${flatpak_packages[@]}"
        ;;
    esac
}
# }}}

# 11. keychron k2v2 fix {{{
fix_keychron(){
    local res
    echo "${info} Updating fn-mode value for keychron k2v2, this will rebuild your initramfs"
    read -r -p "Are you sure? [y/N] " res
    case "${res}" in
        [yY][eE][sS]|[yY])
            echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
            # make a new initramfs
            if [[ -x "$(command -v pacman)" ]]; then
                echo "${info} Arch based distribution: Using 'mkinitcpio -P'"
                mkinitcpio -P
                echo "${succ} Done."
            elif [[ -x "$(command -v apt)" ]]; then
                echo "${info} Ubuntu/Debian based distribution: Using 'update-initramfs -u'"
                update-initramfs -u
                echo "${succ} Done."
            else
                echo "${error} Non-Arch/Debian/Ubuntu based distro, update me this script"
                exit
            fi

            # reboot for the new initramfs
            echo "${warn} Reboot required for changes to take effect."
            reboot_system
        ;;
        *)
            echo "${info} Nothing done for keychron keyboard."
        ;;
    esac
}
# }}}

# Finale: reboot system {{{
reboot_system(){
    local res
    read -r -p "${info} Do you want to reboot the system? [y/N] " res
    case "${res}" in
        [yY][eE][sS]|[yY])
            echo "${warn} Reboot in 10 seconds."
            sleep 10
            reboot
        ;;
        *)
            echo "${warn} Rebooting the system is strongly recommended."
        ;;
    esac
}
# }}}

# main stream {{{
main() {
    # 1. set up git
    git_setup
    # 2. install pacman packages
    pacman_install
    # 3. other package managers stuff
    # 3.1. rustup
    rustup_setup
    # 4. install aur packages
    aur_install
    # 5. enable snap
    snap_setup
    # 6. enable flatpak
    flatpak_setup
    # 7. install git repos
    git_install
    # 8. link configs
    link_configs
    # 9. install snap packages
    snap_install
    # 10. install flatpak packages
    flatpak_install
    # 11. keychron k2v2 fix
    fix_keychron
    # Finale: reboot system
    reboot_system
}
# }}}

main
