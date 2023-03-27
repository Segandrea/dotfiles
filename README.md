# Dotfiles for linux

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

* [Hasklig](https://www.programmingfonts.org/#hasklig) nerdfonts (requires installation).
* [Dracula](https://draculatheme.com/alacritty) colorscheme (no need to reinstall).

## Bash

* `.bashrc`: Sources some bash files, enables some utilites.
* `.config/bash/`:
  - `aliases.bash`: Contains bash aliases, sourced by `.bashrc`
  - `completion/`: Contains completion script, all sourced by `completions.bash`
  - `completions.bash`: Sources completion scripts, sourced by `.bashrc`
  - `env.bash`: Contains env variables, sourced by `.bashrc`
  - `functions.bash`: Contains bash functions, sourced by `.bashrc`
  - `ignorefiles/`: Contains infos for programs that need to ignore files
  - `keybindings.bash`: Contains keybindings only for bash, sourced by `.bashrc`

## Gitconfig

`gitconfig/` contains a basic git configuration.

## Ideavimrc

`ideavim/` contains the `.ideavimrc` configuration for the vim plugin of the
Jetbrains editors as IntelliJ IDEA.

## Markdownlint

`markdownlint/` contains the configuration for the linter for markdown which
I use to take notes.

## Readline

`readline/` contains the configuration and the keybindings for readline based
programs.

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

## Tmux

> Requires to install [TPM](https://github.com/tmux-plugins/tpm)

Configuration of tmux, uses [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
to install plugins:

* [Dracula Theme](https://draculatheme.com/tmux)
* [Tmux-yank](https://github.com/tmux-plugins/tmux-yank)
* [Tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
* Other plugins will probably be added in future.

## Vim

A small `.vimrc` that requires no plugins.

### settings.ini

`settings.ini` is a file that contains a dconf configuration for GNOME.
> It will often break and change, probably in future it will be removed.
