# The following directive deactivates shellcheck's warning for missing shebang
# shellcheck disable=SC2148
#
# The following deactivates the warning for not following a sourced file
# shellcheck disable=SC1091

# Path of the completion directory
completion_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")/completions"

##
# Absolute paths
# bash completion package
[[ -r "/usr/share/bash-completion/bash_completion" ]] && source "/usr/share/bash-completion/bash_completion"

##
# Environmental paths
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

##
# Configuration path
# Bash completion for tmux
[[ -f "${completion_path}/tmux_completion.bash" ]] && source "${completion_path}/tmux_completion.bash"
# Bash completion for angular (ng)
[[ -f "${completion_path}/angular_completion.bash" ]] && source "${completion_path}/angular_completion.bash" || echo "run: ng completion script > ${completion_path}/angular_completion.bash"
