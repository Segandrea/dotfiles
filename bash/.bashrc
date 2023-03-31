# The following directive deactivates shellcheck's warning for missing shebang
# shellcheck disable=SC2148
#
# The following deactivates the warning for not following a sourced file
# shellcheck disable=SC1091

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ "$(whoami)" = "root" ]] && return

##
# Other utilities
#
# starship prompt
[[ -x "$(command -v starship)" ]] && eval "$(starship init bash)"
# setup colors
[[ -x "$(command -v dircolors)" ]] && eval "$(dircolors -b)"
# tmux
if [[ -x "$(command -v tmux)" && -z "$TMUX" ]]; then
    _tmux_unattached_session="$(tmux list-sessions | grep -v -m 1 attached)"
    if [[ -n "${_tmux_unattached_session}" ]]; then
        tmux attach -t "${_tmux_unattached_session/:*/}"
    else
        tmux new
    fi
fi

# Source global config
[[ -f "/etc/bashrc" ]] && source "/etc/bashrc"
[[ -f "/etc/bash.bashrc" ]] && source "/etc/bash.bashrc"

##
# configs
#
# source env variables
[[ -f "$HOME/.config/bash/env.bash" ]] && source "$HOME/.config/bash/env.bash" 
# source aliases
[[ -f "$HOME/.config/bash/aliases.bash" ]] && source "$HOME/.config/bash/aliases.bash" 
# source functions
[[ -f "$HOME/.config/bash/functions.bash" ]] && source "$HOME/.config/bash/functions.bash"
# enable bash completion
[[ -f "$HOME/.config/bash/completions.bash" ]] && source "$HOME/.config/bash/completions.bash"
# enable bash keybindings
[[ -f "$HOME/.config/bash/keybindings.bash" ]] && source "$HOME/.config/bash/keybindings.bash"

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
