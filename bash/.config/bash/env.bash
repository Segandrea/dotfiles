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
)
for index in "${!script_and_bin_dirs[@]}"; do
  directory="${script_and_bin_dirs[${index}]}"
  if ! echo ":${PATH}:" | grep -q ":${directory}:"; then
    my_paths+=":${directory}"
  fi
done

export PATH="${PATH}${my_paths}"                   # add custom paths to PATH
export HISTCONTROL="ignoreboth"                    # no dups and no blank starting lines
export HISTFILE="$XDG_STATE_HOME/bash/history"     # use .bash_history as file for storing history
export PAGER="less"                                # use less as pager
export LESSHISTFILE="$XDG_STATE_HOME/less/history" # place less history inside XDG_STATE directory
export EDITOR="nvim"                               # use vim as default editor
export BROWSER="google-chrome"                     # use chrome as default browser
export NVM_DIR="$HOME/.nvm"                        # nvm
export FUNCNEST=100                                # limits recursive functions, see 'man bash'
export FZF_DEFAULT_OPTS='--color=bg+:#282a36'      # fzf highlight choice with background color (unseeable) adding cargo executables to path (it is some how already set)
export INPUTRC="$HOME/.config/readline/.inputrc"   # readline configuration

# User XDG Base Directory Specifications
export XDG_CACHE_HOME="$HOME/.cache"       # analogous to /var/cache/
export XDG_CONFIG_HOME="$HOME/.config"     # analogous to /etc/
export XDG_DATA_HOME="$HOME/.local/share"  # analogous to /usr/share/
export XDG_STATE_HOME="$HOME/.local/state" # analogous to /var/lib/

# my most used directories
export DOCUMENTS_DIR="$HOME/Documents"
export DOWNLOADS_DIR="$HOME/Downloads"
export DESKTOP_DIR="$HOME/Desktop"
export PICTURES_DIR="$HOME/Pictures"
export VIDEOS_DIR="$HOME/Videos"
export WORKSPACES_DIR="$HOME/Workspaces"
export DOTFILES_DIR="$WORKSPACES_DIR/dotfiles"
export IGNORAMUS_DIR="$WORKSPACES_DIR/ignoramus"
