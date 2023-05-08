# The following directive deactivates shellcheck's warning for missing shebang
# shellcheck disable=SC2148

##
# environment configuration
#
shopt -s cdspell      # correct typos in directory names during cd
shopt -s dirspell     # correct typos in directory during autocompletion
shopt -s checkwinsize # check and update the values of LINES and COLUMNS
shopt -s histappend   # append to history

# Defining my paths
declare -a script_and_bin_dirs=(
  "$HOME/.cargo/bin" # cargo binaries
  "$HOME/.local/bin" # local binaries
  "$HOME/.local/script" # local binaries
)
for index in "${!script_and_bin_dirs[@]}"; do
  directory="${script_and_bin_dirs[${index}]}"
  if ! echo ":${PATH}:" | grep -q ":${directory}:"; then
    my_paths+=":${directory}"
  fi
done

# User XDG Base Directory Specifications
export XDG_CACHE_HOME="$HOME/.cache"       # analogous to /var/cache/
export XDG_CONFIG_HOME="$HOME/.config"     # analogous to /etc/
export XDG_DATA_HOME="$HOME/.local/share"  # analogous to /usr/share/
export XDG_STATE_HOME="$HOME/.local/state" # analogous to /var/lib/

export PATH="${PATH}${my_paths}"                   # add custom paths to PATH
export HISTCONTROL="ignoreboth"                    # no dups and no blank starting lines
[[ ! -d "$XDG_STATE_HOME/bash" ]] && mkdir -p -- "$XDG_STATE_HOME/bash"
export HISTFILE="$XDG_STATE_HOME/bash/history"     # place bash history inside XDG_STATE directory (needs to be created)
export PAGER="less"                                # use less as pager
[[ ! -d "$XDG_STATE_HOME/less" ]] && mkdir -p -- "$XDG_STATE_HOME/less"
export LESSHISTFILE="$XDG_STATE_HOME/less/history" # place less history inside XDG_STATE directory (needs to be created)
export EDITOR="nvim"                               # use vim as default editor
export BROWSER="google-chrome"                     # use chrome as default browser
export NVM_DIR="$XDG_CONFIG_HOME/nvm"              # nvm
export FUNCNEST=100                                # limits recursive functions, see 'man bash'
export FZF_DEFAULT_OPTS='--color=bg+:#282a36'      # fzf highlight choice with background color (unseeable) adding cargo executables to path (it is some how already set)

# my most used directories
export DOCUMENTS_DIR="$HOME/Documents"
export DOWNLOADS_DIR="$HOME/Downloads"
export DESKTOP_DIR="$HOME/Desktop"
export PICTURES_DIR="$HOME/Pictures"
export VIDEOS_DIR="$HOME/Videos"
export WORKSPACES_DIR="$HOME/Workspaces"
export DOTFILES_DIR="$WORKSPACES_DIR/dotfiles"
export IGNORAMUS_DIR="$WORKSPACES_DIR/Ignoramus"
