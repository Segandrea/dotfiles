#!/usr/bin/env bash

# bash completion package
[[ -r "/usr/share/bash-completion/bash_completion" ]] && source "/usr/share/bash-completion/bash_completion"
# bash completion for tmux
[[ -f "completions/tmux_completion.bash" ]] && source completions/tmux_completion.bash
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
