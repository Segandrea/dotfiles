# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ "$(whoami)" = "root" ]] && return

# Source global config
[[ -f "/etc/bashrc" ]] && source "/etc/bashrc"
[[ -f "/etc/bash.bashrc" ]] && source "/etc/bash.bashrc"
# Source bash-completion
[[ -r "/usr/share/bash-completion/bash_completion" ]] && source "/usr/share/bash-completion/bash_completion"

##
# configs
#
# aliases
[[ -f "$HOME/.aliases.bash" ]] && source "$HOME/.aliases.bash"
# functions
[[ -f "$HOME/.functions.bash" ]] && source "$HOME/.functions.bash"

##
# env
#
# correct typos in directory names during cd
shopt -s cdspell
# correct typos in directory during autocompletion
shopt -s dirspell
# check and update the values of LINES and COLUMNS
shopt -s checkwinsize
# append to history
shopt -s histappend
# don't put duplicate lines or lines starting with space in history
export HISTCONTROL=ignoreboth
# use .bash_history as file for storing history
export HISTFILE="$HOME/.bash_history"
# use less as pager
export PAGER=less
# use vim as default editor
export EDITOR=vim
# use chrome as default browser
export BROWSER=google-chrome
# limits recursive functions, see 'man bash'
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

# starship prompt
eval "$(starship init bash)"
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
