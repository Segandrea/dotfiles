#!/usr/bin/env bash

# Path of the completion directory
completion_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")/completions"

##
# Absolute paths
# bash completion package
[[ -r "/usr/share/bash-completion/bash_completion" ]] && source "/usr/share/bash-completion/bash_completion"

##
# Environmental paths
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

##
# Configuration path
# bash completion for tmux
[[ -f "${completion_path}/tmux_completion.bash" ]] && source "${completion_path}/tmux_completion.bash"
