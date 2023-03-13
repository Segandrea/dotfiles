# Dotfiles for endeavourOS

## Requirements

Uses `stow` to make symlinks.
To link all configurations, from the root directory of dotfiles, do

```bash
bash stow.bash
```

## WARN: Subject to changes, poorly documented and may break

> This repository is used by me to reproduce my dotfiles in case of distro
> hopping or for a fresh start in case something breaks.
>
> Use as your own risk, these dot files will change without notice and the
> documentating READMEs won't probably be updated as often.
> It's better to just look at files for reference if you're not me.
> However, if there is some constructive criticism or improving suggetsion,
> it's more than welcome. Have fun!

## Alacritty

Alacritty terminal configuration, uses:

* [Hasklig](https://www.programmingfonts.org/#hasklig) nerdfonts.
* [Dracula](https://draculatheme.com/alacritty) colorscheme.

## Bash

* `.bashrc`: Sources some bash files, enables some utilites.
* `.inputrc` -> Contains readline configurations
* `bash/`:
  - `bash/aliases.bash`: Contains bash aliases, sourced by `.bashrc`
  - `bash/functions.bash`: Contains bash functions, sourced by `.bashrc`
  - `bash/env.bash`: Contains env variables, sourced by `.bashrc`
  - `bash/completion/`: Contains completion script, all sourced by `completions.bash`
  - `bash/completions.bash`: Sources completion scripts, sourced by `.bashrc`

## Fonts

It's a directory used to install fonts by the `setup.bash` script.
Fonts that I use:

* [Hasklig](https://www.programmingfonts.org/#hasklig) nerdfonts.

## Gnome settings

`settings.ini` is a configuration file for dconf to restore my gnome settings
**Warning**: this file may disappear, it works but it's a little broken.
Some plugins are not working very well because of some gnome updates.
Also I will probably change Desktop Environment or start using SwayWM/Hyprland.

## Ideavimrc

`ideavim/` contains the `.ideavimrc` configuration for the vim plugin of the
Jetbrains editors as IntelliJ IDEA

## Setup script

### Warning

> This script is malfunctioning due to an excessive number of changes.
> It should be refactored and fixed but probably won't because I will
> probably change distro.

`setup.bash` is a script that:

1. Sets some `git` configuration options.
2. Installs packages from `pacman` package manager.
3. Installs language-dependent packages from specific package managers.
4. Installs packages from `aur` using `yay` package manager.
5. Enables `snap` package manager (**NB: will probably become full flatpak**).
6. Enables `flatpak` package manager.
7. Installs `git` repos.
8. Links configuration files to the paths they should be.
9. Installs `snap` packages.
10. Installs `flatpak` packages.
11. Executes a script to fix some problems with keychron k2v2 keyboard.
12. Does other small things: Enables `bluetooth`, Installs `fonts`,
 Installs `grub themes`, Applies `dconf configurations`.
13. `reboot` the system.

## Sgnvim

`sgnvim/` contains the configuration files for Neovim.
Requires neovim 0.8+ and is almost all in lua.
> This will often change, probably it is the less stable part of this repository.
> It also is still a WIP.

It is configured to:

* Use `treesitter`
* Work using `LSPs`
* Interoperate with `tmux`
* Have an appealing but `unbloated UI`
* Show some small `git` related infos.
* Be a decent `markdown` editor (also a good `neorg` editor).

## Starship

`starship.toml` contains the configuration for the [Starsip Prompt](https://starship.rs/)
> Currently installed with snap, but that is causing some problems.

## Tmux

Configuration of tmux, uses [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
to install plugins:

* [Dracula Theme](https://draculatheme.com/tmux)
* [Tmux-yank](https://github.com/tmux-plugins/tmux-yank)
* [Tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
* Other plugins will probably be added in future.

## Vim

A small `.vimrc` that requires no plugins.
