################################################################################
###                                 FUNCTIONS                                ###
################################################################################
##                                                                            ##
## Editing notes:                                                             ##
## - Always check with 'shellcheck ${HOME}/.functions.bash' before sourcing   ##
## - Comments that describe functions must start at the beginning of the line ##
##    with a single # sign followed by a whitespace this is needed for        ##
##    the 'showfunctions()' function                                          ##
## - Comments with other meaning should start with two # sings and can be     ##
##    wherever in the line                                                    ##
##                                                                            ##
################################################################################

# Ping google with time
gping(){
    ping 8.8.8.8 | while read -r pingout; do
        local datedping
        datedping="$(date +"[%T]"): ${pingout}"
        echo "${datedping/: *_/: }"
    done
}

# Ping google using curl Because almawifi blocks ICMP
unigping(){
    declare -i succ_count=0
    declare -i err_count=0
    while true; do
        if curl --silent --head google.com > /dev/null; then
            ((succ_count++))
            echo "$(date +"[%T]") OK: success=${succ_count} errors=${err_count}"
        else
            ((err_count++))
            echo "$(date +"[%T]") ERR: success=${succ_count} errors=${err_count}"
        fi
        sleep 1
    done
}

# Make a directory and cd in it
mkcd(){
    mkdir -p -- "$1" && cd -P -- "$1" || return
}

# cd then clean the screen and do la
cla(){
    cd "$1" && clear && ls -AF
}

# Bakcup or restore a file
bnr(){
    if [[ "$1" == *.bkp ]]; then
        echo "Restoring from bakup"
        cp "$1" "${1%.bkp}"
    else
        echo "Making backup"
        cp "$1" "${1}.bkp"
    fi
}

# Rm but asking if sure because rm -i sucks
ra(){
    echo ""
    echo "###################"
    echo "## Are you sure? ##"
    echo "###################"
    local areyousure=""
    read -r areyousure

    case "${areyousure}" in
        [yY][eE][sS]|[yY]|"")
            command rm -rf "$@"
            ;;
        *)
            echo "Abort."
            ;;
    esac
}

# Choose from inputted values
randomchoice(){
    declare -a choices=( "$@" )
    echo "${choices[$(shuf -i 0-$(($#-1)) -n1)]}"
}

# Flip a coin
flipacoin(){
    [[ "$(shuf -i 1-2 -n1)" == "1" ]] && echo "head" || echo "tail"
}

# Extract things with tar bunzip2 unrar gunzip unzip uncompress 7z
extract(){
  if [ -f "$1" ] ; then
    case "$1"  in
      *.tar.bz2)   tar xjf "$1" ;;
      *.tar.gz)    tar xzf "$1" ;;
      *.bz2)       bunzip2 "$1" ;;
      *.rar)       unrar x "$1" ;;
      *.gz)        gunzip "$1" ;;
      *.tar)       tar xf "$1" ;;
      *.tbz2)      tar xjf "$1" ;;
      *.tgz)       tar xzf "$1" ;;
      *.zip)       unzip "$1" ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1" ;;
      *.jar)       jar xf "$1" ;;
      *)
                   echo "'$1' cannot be extracted via extract()"
                   exit 1
                   ;;
    esac
  else
    echo "'$1' is not a valid file"
    exit 1
  fi
}

# Edit aliases and eventually source it
ealiases(){
    local do_source
    local aliases="${HOME}/.aliases.bash"
    "$EDITOR" "${aliases}"
    read -rp "Do you want to source ${aliases}? [Y/n] " do_source
    case "${do_source}" in
        [nN][oO]|[nN])
            echo "Not sourced"
        ;;
        *)
            source "${aliases}"
        ;;
    esac
}

# Edit functions and eventually source it
efunctions(){
    local do_source
    local config_file="${HOME}/.functions.bash"
    "$EDITOR" "${config_file}"
    read -rp "Do you want to source ${config_file}? [Y/n] " do_source
    case "${do_source}" in
        [nN][oO]|[nN])
            echo "Not sourced"
        ;;
        *)
            source "${config_file}"
        ;;
    esac
}

# Edit bashrc and eventually source it
ebash(){
    local do_source
    local config_file="${HOME}/.bashrc"
    "$EDITOR" "${config_file}"
    read -rp "Do you want to source ${config_file}? [Y/n] " do_source
    case "${do_source}" in
        [nN][oO]|[nN])
            echo "Not sourced"
        ;;
        *)
            source "${config_file}"
        ;;
    esac
}

# Edit tmux configuration and eventually source it
etmux(){
    local do_source
    local config_file="${HOME}/.tmux.conf"
    "$EDITOR" "${config_file}"
    read -rp "Do you want to source ${config_file}? [Y/n] " do_source
    case "${do_source}" in
        [nN][oO]|[nN])
            echo "Not sourced"
        ;;
        *)
            tmux source-file "${config_file}"
        ;;
    esac
}

# List all custom functions
showfunctions(){
    grep -A 1 -e "^# .*" "${HOME}/.functions.bash"
}

# Fzf to a directory or edit a file from home
fzfopen(){
    local target
    local path_to_avoid="$HOME/\.|$HOME/Android|$HOME/ApkProjects|$HOME/snap|$HOME/Music|$HOME/Pictures|$HOME/Public|$HOME/Templates|$HOME/Videos|.git/|.idea/"
    local preview="[[ -d {} ]] && tree -CL 2 {} || bat --color=always --style=plain --line-range=:50 {}"
    target="$(fd . "$HOME" --hidden | grep -Ev "${path_to_avoid}" | fzf --no-info --preview="${preview}" --border=rounded --prompt='Search: ' --pointer='➜' --delimiter='/' --with-nth='4..')"

    if [[ -d "${target}" ]]; then
        cd "${target}" || return
    elif [[ -f "${target}" ]]; then
        nvim "${target}"
    fi
}

# Color manpages with a dracula like colorscheme
man() {
    # ..-md is "from bold start" (01 is black bg; 34 is purple text) and ..-me is "from bold end" (0 is color reset)
    # ..-us is "from underline start" (01 is black bg; 32 is green text) and ..-ue is "form underline end" (0 is color reset)
    # ..-so is "from stand-out start" (44 is purple bg; 37 is white text) and ..-se is "form stand-out end" (0 is color reset)
    LESS_TERMCAP_md=$'\e[01;34m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[44;37m' \
    LESS_TERMCAP_se=$'\e[0m' \
    command man "$@"
}
