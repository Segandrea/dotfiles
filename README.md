# Dotfiles for linux

## Requirements

The directories of this repository will be linked in the right place using
a [program](https://www.gnu.org/software/stow/) called `stow` that makes symlinks
based on the [structure](2023-11-23_structure.md) of the various directories.

To link all configurations, from the root directory of dotfiles, do

```bash
bash stow.bash
```

## WARN: Subject to changes, poorly documented and may break

> This repository is used by me to reproduce my dotfiles in case of distro
> hopping or for a fresh start in case something breaks.
> NOTE: some commands are distro-specific.
>
> Use as your own risk, these dot files will change without notice and the
> documentating READMEs won't probably be updated as often.
> It's better to just look at files for reference if you're not me.
> However, if there is some constructive criticism or improving suggetsion,
> it's more than welcome. Have fun!

## Alacritty

Contains the configuration for [Alacritty](https://alacritty.org/).

Linked to:

* `~/.config/alacritty/`

Requires:

* [Hasklig](https://www.programmingfonts.org/#hasklig) nerdfonts (requires installation).

Uses:

* [Dracula](https://draculatheme.com/alacritty) colorscheme (no need to reinstall).

## Autostart

Contains `.desktop` files to launch applications on startup.

Linked to:

* `~/.config/autostart/`

## Bash

Contains the configuration for [Bash](https://www.gnu.org/software/bash/).

Linked to:

* `~/.bashrc`
* `~/.config/bash/`

It has the following structure:

* `.bashrc`: sources the configurations from `.config/bash`
* `.config/bash/`:
  - `aliases.bash`: Contains bash aliases
  - `completions.bash`: Sources completion scripts from `completion/`
  - `env.bash`: Contains env variables
  - `functions.bash`: Contains bash functions
  - `keybindings.bash`: Contains keybindings only for bash

Requires:

* [Git](https://git-scm.com/)
* [GNU coreutils](https://www.gnu.org/software/coreutils/)
* [Starship](https://starship.rs/)
* [Tmux](https://github.com/tmux/tmux/wiki)

Uses:

* [Calibre](https://calibre-ebook.com/)
* [Dnf](https://flatpak.org/)
* [Fd](https://github.com/sharkdp/fd)
* [Flatpak](https://flatpak.org/)
* [Fzf](https://github.com/junegunn/fzf)
* [Neovim](https://neovim.io/)
* [Node Version Manager](https://github.com/nvm-sh/nvm)
* [Spotify](https://community.spotify.com/)
* [Rust and its toolchain](https://rustup.rs/)
* [Tealdeer](https://dbrgn.github.io/tealdeer/)
* [Vim](https://www.vim.org/)
* [Wayland Clipboard](https://github.com/bugaevc/wl-clipboard)

## Eslint

Contains the configuration for [ESlint](https://eslint.org/)

Linked to:

* `~/.config/eslint/`

## Fd

Contains the ignorefile for [Fd](https://github.com/sharkdp/fd)

Linked to:

* `~/.config/fd/`

## Gitconfig

Contains a basic git configuration.

Linked to:

* `~/.gitconfig`

Requires:

* [Git](https://git-scm.com/)

## Gtk

Contains the `.css` files for `gtk-3.0` and `gtk-4.0` to remove the titlebar
from windows.

Linked to:

* `~/.config/gtk-3.0/`
* `~/.config/gtk-4.0/`

## Ideavimrc

Contains the configuration for the `ideavim` [plugin](https://github.com/JetBrains/ideavim)
for [Jetbrains IDEs](https://www.jetbrains.com/products/#type=ide-vs).

## Markdownlint

Contains the configuration for [Markdownlint](https://github.com/DavidAnson/markdownlint),
the linter for markdown.

Linked to:

* `~/.config/markdownlint/`

## Readline

Contains the configuration and the keybindings for [Readline](https://tiswww.case.edu/php/chet/readline/rltop.html)
based programs.

Linked to:

* `~/.inputrc`

## Scripts

Contains some useful scripts.

Linked to:

* `~/.local/bin/scripts/`

## Sgnvim

Contains the configuration files for [Neovim 0.8+](https://neovim.io/).
> Subject to continuous breaking changes and thats the problem with neovim.
> FIXME: Currently Broken

Linked to:

* `~/.config/sgnvim/`

Requires:

* [Lua](https://www.lua.org/)

Uses:

* Currently WIP

## Starship

Contains the configuration for the [Starsip Prompt](https://starship.rs/)

Linked to:

* `~/.config/starship.toml`

## Tmux

Contains the configuration for [Tmux](https://github.com/tmux/tmux/wiki).

Linked to:

* `~/.config/tmux/tmux.conf`
* `~/.config/tmux/plugins/`

Requires:

* [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

Uses:

* [Dracula Theme](https://draculatheme.com/tmux)
* [Tmux-yank](https://github.com/tmux-plugins/tmux-yank)
* [Tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
* Other plugins will probably be added in future.

## Vim

Contains a small configuration that requires no plugins for basic code editing.

Linked to:

* `~/.vimrc`

### stow.bash and settings.ini

These two files are not linked around, rather they are used to link the other
files around and to configure [GNOME](https://www.gnome.org/).

In particular:

* `stow.bash` is a bash script that just links the directories to the place
where they belong using [GNU Stow](https://www.gnu.org/software/stow/).

* `settings.ini` is a file that contains a `dconf` dump of the GNOME configuration,
it can be restored with the bash alias `dconfload`.
