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

# The following directive deactivates shellcheck's warning for missing shebang
# shellcheck disable=SC2148

# Ping google with time
gping() {
  ping 8.8.8.8 | while read -r pingout; do
    local datedping
    datedping="$(date +"[%T]"): ${pingout}"
    echo "${datedping/: *_/: }"
  done
}

# Ping google using curl Because almawifi blocks ICMP
unigping() {
  declare -i succ_count=0
  declare -i err_count=0
  declare -i pack_count=1
  while true; do
    if curl --silent --head google.com > /dev/null; then
      ((succ_count++))
      echo "$(date +"[%T]") ${pack_count} OK: success=${succ_count} errors=${err_count}"
    else
      ((err_count++))
      echo "$(date +"[%T]") ${pack_count} ERR: success=${succ_count} errors=${err_count}"
    fi
    ((pack_count++))
    sleep 1
  done
}

# Make a directory and cd in it
mkcd() {
  mkdir -p -- "$1" && cd -P -- "$1" || return
}

# cd then clean the screen and do la
cla() {
  cd -- "$1" && clear && ls -AF
}

# Bakcup or restore a file
toggle_backup() {
  local target="${1/\//}"
  # NB. if target and target.bkp both exist and are directories,
  # this function will always copy the files from one of the two
  # that are not in the other.
  if [[ "${target}" == *.bkp ]]; then
    echo "Restoring from bakup.."
    cp -rTi -- "${target}" "${target%.bkp}"
  else
    echo "Making backup.."
    cp -rTi -- "${target}" "${target}.bkp"
  fi
  echo "Done."
}

# Rm but asking if sure because rm -i sucks
ra() {
  echo ""
  echo "###################"
  echo "## Are you sure? ##"
  echo "###################"
  local areyousure=""
  read -r areyousure

  case "${areyousure}" in
    [yY][eE][sS]|[yY]|"")
      command rm -rf -- "$@"
      ;;
    *)
      echo "Abort."
      ;;
  esac
}

# Choose from inputted values: array of args
randomchoice() {
  declare -a choices=( "$@" )
  echo "${choices[$(shuf -i 0-$(($#-1)) -n1)]}"
}

# Flip a coin
flipacoin() {
  [[ "$(shuf -i 1-2 -n1)" == "1" ]] && echo "head" || echo "tail"
}

# Extract things with tar bunzip2 unrar gunzip unzip uncompress 7z
extract() {
  if [ -f "$1" ] ; then
    case "$1"  in
      *.tar.bz2)   tar xjf "$1" ;;
      *.tar.gz)    tar xzf "$1" ;;
      *.tar.xz)    tar xJf "$1" ;;
      *.txz)       tar xJf "$1" ;;
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
                   return 1
                   ;;
    esac
  else
    echo "'$1' is not a valid file"
    return 1
  fi
}

# List all custom functions
showfunctions() {
  if [[ -z "$1" ]]; then
    grep -A 1 -e "^# .*" "$(realpath "${BASH_SOURCE[0]}")"
  else
    grep -A 1 -e "^# .*" "$(realpath "${BASH_SOURCE[0]}")" | grep -B 1 -A 1 -m 1 -i "$1"
  fi
}

# Fzf to a directory from $HOME
goto() {
  local target
  target="$(cd && { fd --type directory --follow --hidden --strip-cwd-prefix --ignore-file "$XDG_CONFIG_HOME/bash/ignorefiles/.fd_goto_ignored_dirs" | sort | fzf --exact --no-info --reverse --preview='tree -CL 2 {}' --delimiter='/' --pointer='➜' --prompt='Go to: '; })" #
  if [[ -n "${target}" ]]; then
    cd -- "$HOME/${target}" || return
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

# Set a timer: arg1 = "text", arg2 = time(eg. 3d 1h 32m 16.034s NB. unquoted)
timer() {
  local text
  [[ -z "$1" ]] && text='Alarm' || text="$1"
  declare -a time
  [[ -z "${*:2}" ]] && time=('1s') || time=("${@:2}")

  (sleep "${time[@]}" && notify-send "${text}" &)
}

# Connect bluetooth: arg1 = "off|disconnect|remove" (optional)
bt() {
  local opt
  opt="$1"
  local device
  local device_name
  local device_addr
  case "${opt}" in
    [pP][oO][wW][eE][rR][oO][fF][fF]|[oO][fF][fF]|[oO])
      # Switch off
      bluetoothctl power off
    ;;
    [dD][iI][sS][cC][oO][nN][nN][eE][cC][tT]|[dD][iI][sS][cC]|[dD])
      # Disconnect
      device="$(bluetoothctl devices Connected | sed "s/Device //" | fzf --no-info --delimiter=' ' --with-nth='2..' --prompt='Disconnect from: ' --pointer='➜')"
      if [[ -z "${device}" ]]; then
        echo "Error: A device needs to be selected."
        return
      fi
      device_name="${device/+([![:space:]])@([[:space:]])/}"
      device_addr="${device//+([[:space:]])*([![:space:]])/}"
      if [[ -z "${device_addr}" ]]; then
        echo "Error retrieving device address."
        return
      fi
      echo "Disconnecting ${device_name}"
      bluetoothctl disconnect "${device_addr}" > /dev/null && echo "Successfully disconnected" || echo "Disconnection failed"
    ;;
    [rR][eE][mM][oO][vV][eE]|[rR][mM]|[rR])
      # Remove
      device="$(bluetoothctl devices Paired | sed "s/Device //" | fzf --no-info --delimiter=' ' --with-nth='2..' --prompt='Remove: ' --pointer='➜')"
      if [[ -z "${device}" ]]; then
        echo "Error: A device needs to be selected."
        return
      fi
      device_name="${device/+([![:space:]])@([[:space:]])/}"
      device_addr="${device//+([[:space:]])*([![:space:]])/}"
      if [[ -z "${device_addr}" ]]; then
        echo "Error retrieving device address."
        return
      fi
      bluetoothctl remove "${device_addr}" > /dev/null && echo "${device_name} correctly removed" || echo "Remotion failed"
    ;;
    [hH][eE][lL][pP]|[hH])
      echo 'Usage: bt [OPTION]'
      echo 'Wrapper for bluetoothctl'
      echo 'Connect, pair, disconnect, remove devices and eventually poweroff bluetooth'
      echo ''
      echo 'Arguments are case insensitive'
      echo ''
      echo '  bt                   Invalid args or no args to connect'
      echo '  bt disconnect        Disconnect a connected device'
      echo '     disc'
      echo '     d'
      echo '  bt poweroff          Poweroff bluetooth'
      echo '     off'
      echo '     o'
      echo '  bt remove            Remove a paired device'
      echo '     rm'
      echo '     r'
      echo '  bt scan              Scan and then connect'
      echo '     s'
    ;;
    [sS][cC][aA][nN]|[sS])
      # Scan and Connect
      bluetoothctl power on
      echo "Scanning..."
      bluetoothctl --timeout 5 scan on > /dev/null
      device="$(bluetoothctl devices | sed "s/Device //" | fzf --no-info --delimiter=' ' --with-nth='2..' --prompt='Connect to: ' --pointer='➜')"
      if [[ -z "${device}" ]]; then
        echo "Error: A device needs to be selected."
        return
      fi
      device_name="${device/+([![:space:]])@([[:space:]])/}"
      device_addr="${device//+([[:space:]])*([![:space:]])/}"
      if [[ -z "${device_addr}" ]]; then
        echo "Error retrieving device address."
        return
      fi
      bluetoothctl agent NoInputNoOutput
      if ! bluetoothctl devices Paired | grep -q "${device}"; then
        echo "Pairing with ${device_name}..."
        bluetoothctl pair "${device_addr}" > /dev/null && echo "Device ${device_name} paired" || echo "Pairing failed"
        bluetoothctl trust "${device_addr}" > /dev/null && echo "Device ${device_name} trusted" || echo "Device ${device_name} can't be trusted"
      fi
      echo "Connecting to ${device_name}..."
      bluetoothctl connect "${device_addr}" > /dev/null && echo "Successfully connected" || echo "Connection failed"
    ;;
    *)
      # Connect to a known device
      bluetoothctl power on
      device="$(bluetoothctl devices Paired | sed "s/Device //" | fzf --no-info --delimiter=' ' --with-nth='2..' --prompt='Connect to: ' --pointer='➜')"
      if [[ -z "${device}" ]]; then
        echo "Error: A device needs to be selected."
        return
      fi
      device_name="${device/+([![:space:]])@([[:space:]])/}"
      device_addr="${device//+([[:space:]])*([![:space:]])/}"
      if [[ -z "${device_addr}" ]]; then
        echo "Error retrieving device address."
        return
      fi
      bluetoothctl agent NoInputNoOutput
      echo "Connecting to ${device_name}..."
      bluetoothctl connect "${device_addr}" > /dev/null && echo "Successfully connected" || echo "Connection failed"
    ;;
  esac
}

# Get help with tldr
gethelp() {
  local target
  target="$(tldr -l | sed -e "s/\[\|\]\|'//g" -e "s/, /\n/g" | fzf --no-info --preview='tldr {}' --prompt='tl;dr of help: ' --pointer='➜')"
  [[ -n "${target}" ]] && tmux neww "tldr ${target}; exec bash" && return
}

# vim: foldmethod=indent foldminlines=0 foldlevel=0
