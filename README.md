# Dotfiles for endeavourOS

## Disclaimer: Subject to changes, little documentation.
> Use at your own risk, these dotfiles will change without notice and the documentation won't be the best.
> Suggestions and constructive criticism are always welcome.

## Bash
Bash configuration is splitted in different files:
* `bash/aliases.bash` -> contains aliases
* `bash/functions.bash` -> contains useful functions
* `bash/env.bash` -> contains environmental variables and configurations
* `bash/completions.bash` -> sources completion scripts
* `bash/completion/` -> contains completion script for programs that are not included in the package `bash-completion`
* `.inputrc` -> contains readline configurations
* `.bashrc` -> sources other bash files and activate utilities like [Starsip Prompt](https://starship.rs/) and [Tmux](https://github.com/tmux/tmux/wiki)

## Vim
A small `.vimrc` that requires no plugins.

## Alacritty
Alacritty terminal configuration uses [Hasklig](https://www.programmingfonts.org/#hasklig) fonts and includes the colors of the [Dracula](https://draculatheme.com/alacritty) colorscheme.

## Fonts
It's a directory used to install fonts by the `setup.bash` script.

## Settings
`settings.ini` is a configuration file for dconf to restore my gnome settings (_I will probably change Desktop environment in the future_)

## Starship
Configuration for the [Starsip Prompt](https://starship.rs/)

## Tmux
Configuration of tmux, uses [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) to install plugins:
* [Dracula Theme](https://draculatheme.com/tmux)
* [Tmux-yank](https://github.com/tmux-plugins/tmux-yank)
* [Tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
* Others will probably be added in future.

## Setup script
A setup script for:
* Git configuration and installation of repos
* Installing packages from official sources
* Enabling and installing `flatpak `and `snap`
* Installing specific stuff from other sources
* Linking configuration files in the `$HOME` directory
* Eventually setting up some other stuff
* This script will probably change a lot over time.
