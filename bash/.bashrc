# The following directive deactivates shellcheck's warning for missing shebang
# shellcheck disable=SC2148
#
# The following deactivates the warning for not following a sourced file
# shellcheck disable=SC1091

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

##
# Other utilities
#
# starship prompt
[[ -x "$(command -v starship)" ]] && eval "$(starship init bash)"
# zoxide instead of cd
[[ -x "$(command -v zoxide)" ]] && eval "$(zoxide init bash --cmd cd)"
# setup colors
[[ -x "$(command -v dircolors)" ]] && eval "$(dircolors --bourne-shell)"
# tmux
if [[ -x "$(command -v tmux)" && -z "$TMUX" ]]; then
    _tmux_unattached_session="$(tmux list-sessions | grep --invert-match --max-count=1 attached)"
    if [[ -n "${_tmux_unattached_session}" ]]; then
        tmux attach -t "${_tmux_unattached_session/:*/}"
    else
        tmux new
    fi
fi

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
