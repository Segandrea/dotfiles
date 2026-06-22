# Dotfiles for Linux

Personal configuration files for a Fedora + GNOME (Wayland) setup, themed around
[Dracula](https://draculatheme.com/) and driven from the terminal
(Bash + Tmux + Neovim/Vim).

## Installation

Everything (system setup **and** config linking) is done by a single script:

```bash
curl -sSLf https://raw.githubusercontent.com/Segandrea/dotfiles/refs/heads/main/install.bash | bash
```

> **Heads up — this is a personal, opinionated, Fedora-specific bootstrap.**
> Read [What `install.bash` does](#what-installbash-does) before running it. It
> uses `sudo`, changes the hostname, enables third-party repos, installs a long
> list of packages, and rewrites GNOME settings from a `dconf` dump.

## ⚠️ Disclaimer

> This repository is used by me to reproduce my environment when distro-hopping
> or starting fresh after I break something.
>
> - **It changes without notice** and is poorly documented on purpose — this
>   README tries to stay useful, but the files are always the source of truth.
> - **Some commands are distro-specific** (Fedora `dnf`, `flatpak`, `copr`, etc.)
>   and a few values are hardware-specific to my machine (see
>   [Machine-specific values](#machine-specific-values)).
> - **Use at your own risk.** If you're not me, treat this as a reference to read
>   rather than something to run as-is.
>
> Constructive criticism and improvement suggestions are always welcome. Have fun!

## How it works

Configs are symlinked into place with [GNU Stow](https://www.gnu.org/software/stow/).
Each top-level directory is a Stow **package** whose internal layout mirrors
`$HOME`. For example:

```
bash/
├── .bashrc                     ->  ~/.bashrc
└── .config/bash/aliases.bash   ->  ~/.config/bash/aliases.bash
```

Running `stow bash` from the repo root recreates that tree as symlinks under
`$HOME`. To (re)link everything manually:

```bash
cd ~/Workspaces/dotfiles
stow --target="$HOME" alacritty autostart bash fd gitconfig gtk \
     nvim ideavim readline scripts starship tmux vim
```

The installer adds `--adopt` to the first run so that any *pre-existing* files are
absorbed into the repo instead of causing a conflict, then immediately runs
`git reset --hard` to replace those adopted contents with the repo's versions.
This is convenient but **destructive to whatever config you already had** — the
installer guards it by refusing to stow if the repo has uncommitted changes.

### Files that are *not* stowed

These live in the repo root and are used directly rather than symlinked:

| File                  | Purpose                                                              |
| --------------------- | ------------------------------------------------------------------- |
| `install.bash`        | The bootstrap script (system setup + stow + GNOME restore).         |
| `settings.ini`        | A `dconf` dump of the GNOME configuration (see [GNOME](#gnome)).     |
| `vimium-options.json` | A [Vimium](#vimium) settings backup, imported manually in-browser.  |

## What `install.bash` does

The script is **Fedora-only** (it checks `/etc/os-release` and exits otherwise),
uses `set -euo pipefail`, and logs every step with colored output. In order, it:

1. **Optimizes DNF** — fastest mirror, parallel downloads, `defaultyes`, keep cache.
2. **Updates the system** and enables **RPM Fusion** (free + nonfree), installs
   the multimedia/codecs groups, swaps in the full `ffmpeg`, and sets up hardware
   video acceleration (AMD `mesa-va-drivers-freeworld`) and OpenH264 for Firefox.
3. **Sets the hostname** to `hornet`.
4. **Enables Flatpak/Flathub** and installs AppImage support (GearLever).
5. Enables a few **COPRs** (`starship`, `scrcpy`) and the **Terra** repo.
6. Installs **command-line tools**: `bat`, `calibre`, `dconf`, `fd-find`, `fzf`,
   `git`, `neovim`, `starship`, `stow`, `tealdeer`, `tmux`, `vim`, `zoxide`,
   archive tools, and more.
7. Installs **GNOME extras**: `pop-shell`, `screen-autorotate`, `gnome-tweaks`,
   Extension Manager, etc.
8. Installs the **Rust toolchain** via `rustup`.
9. Installs **apps** — from DNF (`alacritty`, `kitty`) and Flatpak (Android Studio,
   Brave, IntelliJ IDEA CE, Spotify, Stremio, Telegram, Flatseal, Embellish).
10. **Clones this repo** to `~/Workspaces/dotfiles` and **stows** the packages.
11. **Restores GNOME settings** with `dconf load / < settings.ini`.

### After installation

The script reminds you to do these by hand:

1. Install secrets such as SSH keys.
2. `chmod 600 ~/.ssh/<private_key>` and `chmod 644 ~/.ssh/<public_key>.pub`.
3. Switch the remote to SSH:
   `git remote set-url origin git@github.com:Segandrea/dotfiles.git`.
4. Install the **Hasklug Nerd Font** (easiest via
   [Embellish](https://flathub.org/apps/io.github.getnf.embellish)).

## Packages

| Package                   | Linked to                                  |
| ------------------------- | ------------------------------------------ |
| [Alacritty](#alacritty)   | `~/.config/alacritty/`                     |
| [Autostart](#autostart)   | `~/.config/autostart/`                     |
| [Bash](#bash)             | `~/.bashrc`, `~/.config/bash/`             |
| [Fd](#fd)                 | `~/.config/fd/`                            |
| [Gitconfig](#gitconfig)   | `~/.gitconfig`                             |
| [Gtk](#gtk)               | `~/.config/gtk-3.0/`, `~/.config/gtk-4.0/` |
| [Ideavim](#ideavim)       | `~/.config/ideavim/`                       |
| [Nvim](#nvim)             | `~/.config/nvim/`                          |
| [Readline](#readline)     | `~/.inputrc`                               |
| [Scripts](#scripts)       | `~/.local/bin/scripts/`                    |
| [Starship](#starship)     | `~/.config/starship.toml`                  |
| [Tmux](#tmux)             | `~/.config/tmux/`                          |
| [Vim](#vim)               | `~/.vimrc`                                  |

### Alacritty

Configuration for the [Alacritty](https://alacritty.org/) terminal: a hardcoded
Dracula colorscheme, no window decorations, and the **Hasklug Nerd Font Mono**
(install separately — see [After installation](#after-installation)).

### Autostart

`.desktop` files launched by GNOME on login:

- `jetbrains-toolbox.desktop` — starts JetBrains Toolbox minimized.
- `startupscripts.desktop` — runs `launchStartupScripts.bash` (see [Scripts](#scripts)).

### Bash

The Bash setup is modular: `.bashrc` is a thin loader that sources focused files
from `~/.config/bash/`.

```
.bashrc                  # loader: sources the files below, then sets up
                         # starship, zoxide (as `cd`), tmux auto-attach, nvm,
                         # sdkman and cargo
.config/bash/
├── env.bash             # environment variables, PATH, XDG dirs
├── aliases.bash         # aliases
├── functions.bash       # shell functions
├── completions.bash     # sources system + per-tool completion scripts
├── keybindings.bash     # bash-only key bindings (and fzf bindings)
└── completions/         # angular, cargo, npm, nvm, rustup, tmux completions
```

Highlights:

- **XDG Base Directory compliance** — Bash, `less`, and `wget` histories are
  relocated under `$XDG_STATE_HOME` to keep `$HOME` clean.
- **Auto-attach to Tmux** — an interactive login attaches to the first unattached
  Tmux session, or starts a new one.
- **`zoxide` replaces `cd`** for smarter directory jumping.
- **Self-documenting functions** — run `showfunctions` to list every custom
  function (and `showfunctions <term>` to search them). Functions follow a
  convention where a `# ` comment on the line above each definition is its help
  text.

A few notable functions in `functions.bash`:

| Function          | Description                                                         |
| ----------------- | ------------------------------------------------------------------- |
| `mkcd <dir>`      | Make a directory and `cd` into it.                                  |
| `extract <file>`  | Extract almost any archive format by extension.                     |
| `bt`              | Scan, pair and connect a Bluetooth device picked via `fzf`.         |
| `gethelp`         | Fuzzy-pick a command and show its `tldr` cheatsheet.                |
| `man`             | `man` wrapped with a Dracula-flavored colorscheme.                  |
| `timer` / `alarm` | Fire a desktop notification after a delay / at a given time.        |
| `wallpaper`       | Pick a wallpaper with `fzf` and set it in GNOME.                    |
| `battery-care`    | Toggle the 80% charge limit (Lenovo IdeaPad-specific).              |
| `ra <files...>`   | (Use at your own risk) wrapper around `rm -rf`. **See note below.** |

> **Note on `ra()`** — this is a deliberately *fast* delete helper: it prompts
> `Are you sure? Y/n` but **defaults to "yes" on an empty Enter**. That default is
> intentional (the whole point is to confirm-and-go without extra typing), so be
> aware that just pressing Enter at the prompt will delete the given paths.

> Some functions/aliases are commented out or marked `TODO` — they're parked,
> not active. Read the files for the full, current list.

### Fd

An ignore file for [fd](https://github.com/sharkdp/fd) (linked to
`~/.config/fd/ignore`). It prunes noisy directories (`.cache`, `.git`, build
output, language caches, etc.) and uses an allow-list so that under `~/.config/`
only a handful of selected directories are searched.

### Gitconfig

A minimal global `~/.gitconfig`: user identity, `vim` as editor, `main` as the
default branch, and `vimdiff` as the diff tool.

### Gtk

`gtk.css` for GTK 3 and GTK 4 that hides the title bar / header bar on client-side
decorated windows (e.g. Chrome/Brave), for a cleaner look under GNOME.

### Ideavim

Configuration for the [IdeaVim](https://github.com/JetBrains/ideavim) plugin used
in JetBrains IDEs (linked to `~/.config/ideavim/`):

- `ideavimrc` — options, plugins (`which-key`, `quickscope`, NERDTree,
  highlighted-yank, surround), and an extensive set of `<leader>`-driven mappings
  (window/file/debug/code/refactor actions), with `sethandler` rules deciding
  whether Vim or the IDE handles each key.
- `which-key.vim` — the which-key descriptions for those mappings.

### Nvim

A custom [Neovim](https://neovim.io/) configuration built on
[lazy.nvim](https://github.com/folke/lazy.nvim), with plugins pinned by commit and
locked via `lazy-lock.json` for reproducibility. Structure:

```
nvim/.config/nvim/
├── init.lua            # bootstraps lazy.nvim and loads everything
└── lua/
    ├── base/           # options, autocmds, core mappings
    ├── plugins/        # one file per plugin (lsp, telescope, treesitter, ...)
    │   └── mappings/   # per-plugin keymaps
    └── utils/          # a small mapper helper
```

> **Note:** this hand-rolled config is a work in progress and is **likely to be
> replaced soon by a distribution such as [LazyVim](https://www.lazyvim.org/)**.
> If it misbehaves, that's why — for serious editing, Vim (below) and IdeaVim are
> the stable options for now.

### Readline

`~/.inputrc` for all Readline-based programs: vi editing mode, case-insensitive
and menu-style completion, a vi-mode cursor that changes shape between
insert/command mode, and history search bound to `j`/`k` (and the arrow keys).

### Scripts

User scripts linked to `~/.local/bin/scripts/`:

- `launchStartupScripts.bash` — runs every executable in `startup/`. It's invoked
  automatically by the `startupscripts.desktop` autostart entry; you don't run it
  by hand.
- `startup/random-wallpaper.bash` — picks a random GNOME wallpaper.
- `startup/screenlock.bash` — on screen lock, stops Spotify and powers off
  Bluetooth; on unlock, powers Bluetooth back on and reconnects the previously
  connected devices.

### Starship

Configuration for the [Starship](https://starship.rs/) prompt: a compact
single-line prompt with a custom Tmux window indicator, command duration,
language icons, and a detailed battery segment. Requires a Nerd Font for the
glyphs.

### Tmux

Configuration for [Tmux](https://github.com/tmux/tmux/wiki) (linked to
`~/.config/tmux/`), using the [Dracula](https://draculatheme.com/tmux) theme plus
[tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) and
[tmux-yank](https://github.com/tmux-plugins/tmux-yank). Plugins are managed by
[TPM](https://github.com/tmux-plugins/tpm), which the config **auto-installs on
first launch** (the `plugins/` directory is git-ignored and reinstalled, not
committed).

The prefix is remapped to **`Alt+a`**. Most navigation is bound *without* a prefix
for speed, and pane-movement keys are **Vim-aware** — they pass through to
Neovim/Vim when it's the focused pane:

| Keys                | Action                                  |
| ------------------- | --------------------------------------- |
| `Alt+t`             | New window                              |
| `Alt+n` / `Alt+N`   | Next / previous window                  |
| `Alt+v` / `Alt+o`   | Split vertical / horizontal             |
| `Alt+h/j/k/l`       | Move between panes (Vim-aware)          |
| `Alt+H/J/K/L`       | Resize the current pane                 |
| `Alt+m`             | Zoom (toggle full-screen) the pane      |
| `Alt+q`             | Close pane (Vim-aware)                  |
| `Alt+c` / `Alt+p`   | Enter copy-mode / paste                 |
| `Alt+b`             | Toggle the status bar                   |
| `prefix` + `r`      | Reload the config                       |
| `prefix` + `I`      | Install plugins (TPM)                   |

Copy-mode uses Vi keys (`v` to select, `y` to yank, `r` for rectangle select).

### Vim

A plugin-free `~/.vimrc` for quick, dependency-free editing: sensible defaults,
folding by indent, relative numbers, system-clipboard yank (X11), split
navigation with `Ctrl+h/j/k/l`, line-moving in visual mode, and a handful of
quality-of-life remaps.

## Vimium

`vimium-options.json` is a settings backup for the
[Vimium](https://github.com/philc/vimium) browser extension (it is **not** stowed).

**It must be imported manually**: open the extension's *Options* page and use
**Import** to load this file. Some browsers (e.g. **Brave**) restore extension
settings automatically from their own backup/sync, in which case no manual import
is needed.

## GNOME

`settings.ini` is a full `dconf` dump of the GNOME configuration. The installer
restores it automatically; you can also manage it with the provided aliases:

```bash
dconfdump ~/settings.ini   # dump current GNOME settings to a file
dconfload  ~/settings.ini   # load settings from a file
dconfreset                  # reset all GNOME settings to defaults
```

## Machine-specific values

A few things are tuned to my specific hardware and won't apply elsewhere — adjust
them if you reuse this repo:

- Hostname `hornet` (`install.bash`).
- `huion2screen` alias maps a drawing tablet to `HDMI-2` via a hardcoded `xinput`
  device id (X11 only).
- `battery-care` writes to a Lenovo IdeaPad `conservation_mode` sysfs path.
- AMD-specific video acceleration packages in `install.bash`.
