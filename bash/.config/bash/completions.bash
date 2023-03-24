# The following directive deactivates shellcheck's warning for missing shebang
# shellcheck disable=SC2148
#
# The following deactivates the warning for not following a sourced file
# shellcheck disable=SC1091
#
# The following deactivates the warning for not following a non-constant source
# shellcheck disable=SC1090

# Path of the completion directory
completion_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")/completions"

##
# Absolute paths
# bash completion package
[[ -r "/usr/share/bash-completion/bash_completion" ]] && source "/usr/share/bash-completion/bash_completion"

##
# Configuration path
# sourcing all completion scripts
for file in "${completion_path}/"*completion.bash; do
  source "${file}"
done
