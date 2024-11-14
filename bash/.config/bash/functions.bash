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

## The following directive deactivates shellcheck's warning for missing shebang
#shellcheck disable=SC2148

# Ping google with time
gping() {
  ping 8.8.8.8 | while read -r pingout; do
    local datedping
    datedping="$(date +"[%T]"): ${pingout}"
    echo -ne "\n${datedping/: *_/: }"
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
  mkdir -p -- "$1" && command cd -P -- "$1" || return
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
  echo "#######################"
  echo "## Are you sure? Y/n ##"
  echo "#######################"
  local areyousure=""
  read -r areyousure

  case "${areyousure}" in
    [yY][eE][sS]|[yY][eE]|[yY]|"")
      command rm -rf -- "$@"
      ;;
    *)
      echo "Abort."
      ;;
  esac
}

# Choose from inputted values: randomchoice "arg1" "arg2" ...
randomchoice() {
  declare -a choices=( "$@" )
  echo "${choices[$(shuf --input-range=0-$(($#-1)) --head-count=1)]}"
}

# Flip a coin
flipacoin() {
  [[ "$(shuf --input-range=1-2 --head-count=1)" == "1" ]] &&
    echo "head" || echo "tail"
}

# Extract things with tar bunzip2 unrar gunzip unzip uncompress 7z
extract() {
  if [ -f "$1" ] ; then
    case "$1"  in
      *.tar.bz2)    tar xjf "$1" ;;
      *.tar.gz)     tar xzf "$1" ;;
      *.tar.xz)     tar xJf "$1" ;;
      *.txz)        tar xJf "$1" ;;
      *.bz2)        bunzip2 "$1" ;;
      *.rar)        unrar x "$1" ;;
      *.gz)         gunzip "$1" ;;
      *.tar)        tar xf "$1" ;;
      *.tbz2)       tar xjf "$1" ;;
      *.tgz)        tar xzf "$1" ;;
      *.zip|*.epub) unzip "$1" ;;
      *.Z)          uncompress "$1" ;;
      *.7z)         7z x "$1" ;;
      *.jar)        jar xf "$1" ;;
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
    grep --after-context=1 --regexp="^# .*" "$(realpath "${BASH_SOURCE[0]}")" --color=always | less
  else
    # first grep gets all lines starting with comments and associated functions, second grep filters between them
    grep --after-context=1 --regexp="^# .*" "$(realpath "${BASH_SOURCE[0]}")" | grep --before-context=1 --after-context=1 --max-count=1 --ignore-case "$1"
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
  [[ -z "$1" ]] && text='Timer ended' || text="$1"
  declare -a time
  [[ -z "${*:2}" ]] && time=('1s') || time=("${@:2}")

  (sleep "${time[@]}" && notify-send "${text}" &)
}

# Set an alarm with 'at': arg1 = 'text' arg2 = "HH:MM" (NB. arg2 can be in any format accepted by 'at')
alarm() {
  [[ "$#" -ne 2 ]] && echo 'usage: alarm "some text" "HH:MM (or any format accepted by "at")"' && return
  echo "notify-send '$1'" | at "$2"
}

# Connect bluetooth: arg1 = "off|disconnect|remove" (optional)
bt() {
  local device
  local device_name
  local device_addr
  # Scan and Connect
  bluetoothctl power on
  echo "Scanning..."
  bluetoothctl --timeout 5 scan on > /dev/null
  device="$(
    bluetoothctl devices |
    sed "s/Device //" |
    fzf --no-info --delimiter=' ' --with-nth='2..' --prompt='Connect to: ' --pointer='➜'
  )"
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
}

# Get help with tldr
gethelp() {
  local target
  target="$(
    tldr --list |
    sed --expression="s/\[\|\]\|'//g" --expression="s/, /\n/g" |
    fzf --no-info --preview='tldr {}' --prompt='tl;dr of help: ' --pointer='➜'
  )"
  [[ -n "${target}" ]] && tmux neww "tldr ${target}; exec bash" && return
}

# Pomodoro timer TODO: improve
mopodoro() {
  declare -a farming
  [[ -z "$1" ]] && farming=('30m') || farming=("$1")
  declare -a pause
  [[ -z "$2" ]] && pause=('5m') || pause=("$2")

  (notify-send "Pomodoro started" && sleep "${farming[@]}" && sleep "${pause[@]}" && notify-send "Pomodoro ended" &)
}

# ElBarquo was here
elbarquo() {
  declare -i half_boat_len
  half_boat_len=9

  declare -i half_boat_heigth
  half_boat_heigth=3

  local horizontal_padding
  horizontal_padding=$(( ($(tput cols) / 2) - half_boat_len ))

  local vertical_padding
  vertical_padding=$(( ($(tput lines) / 2 ) - half_boat_heigth))

  local whites
  for _ in $(seq ${horizontal_padding}); do
    whites="${whites} "
  done

  clear

  for _ in $(seq ${vertical_padding}); do
    printf '\n'
  done

  echo "${whites}         /\         "
  echo "${whites}        /  \        "
  echo "${whites}_______/____\_______"
  echo "${whites}\     ElBarquo     /"
  echo "${whites} \________________/ "

  for _ in $(seq ${vertical_padding}); do
    printf '\n'
  done

  sleep 5
  clear
}

# Change gnome wallpaper
wallpaper() {
  local target
  target="$(
    fd --type f --type l --hidden . "$PICTURES_DIR/Gnome/Wallpaper/" |
    fzf \
    --exact \
    --no-info \
    --reverse \
    --preview='tree -CL 2 {}' \
    --delimiter='/' \
    --with-nth -1 \
    --pointer='➜' \
    --prompt='Set as wallpaper '
  )"
  if [[ -n "${target}" ]]; then
    gsettings set org.gnome.desktop.background picture-uri "file://${target}" && \
      gsettings set org.gnome.desktop.background picture-uri-dark "file://${target}" && \
      gsettings set org.gnome.desktop.screensaver picture-uri "file://${target}" && \
      echo "the new wallpaper is ${target}"
  else
    echo "Choose one of the wallpaper or download one and retry"
  fi
}

# Change format of ebooks: arg1 = filename (eg: file.pdf), arg2 = newExtension (eg: epub) [optional]
convert-book() {
  local file
  file="${1}"
  if [[ -z "$2" ]]; then
    echo "Converting to the same extension..."
    ebook-convert "${file}" "converted-${file}"
  else
    local extensionlessfile
    extensionlessfile="${file%.*}"
    local newextension
    newextension="$2"
    echo "Converting to ${newextension} extension..."
    ebook-convert "${file}" "${extensionlessfile}.${newextension}"
  fi
}

# Fix ebook for google play books: arg1 = filename (only works with epubs)
fix-ebook() {
  local file
  file="${1}"
  [[ -z "${file}" ]] && echo "Error: filename required" && return
  case "${file}" in
    *.epub)
      local tmpfile
      tmpfile="${file/%.epub/.mobi}"
      echo "######## Fixing #######"
      ebook-convert "${file}" "${tmpfile}"
      echo -e "\n\n First conversion executed, eliminating original \n\n"
      sleep 5
      rm "${file}"
      ebook-convert "${tmpfile}" "${file}"
      rm "${tmpfile}"
      echo "###### Fixed (?) ######"
      ;;
    *.mobi)
      local tmpfile
      tmpfile="${file/%.mobi/.epub}"
      echo "######## Fixing #######"
      ebook-convert "${file}" "${tmpfile}"
      echo -e "\n\n First conversion executed, eliminating original \n\n"
      sleep 5
      rm "${file}"
      ebook-convert "${tmpfile}" "${file}"
      rm "${tmpfile}"
      echo "###### Fixed (?) ######"
      ;;
    *)
      echo "Error: format not supported"
  esac
}

# Compress images of an ebook (flatpak wrapper): arg1 = filename (eg: file.epub)
##ebook-compress() {
##  local file
##  file="${1}"
##  echo "Compressing images..."
##  flatpak --command="sh" run com.calibre_ebook.calibre -c "ebook-polish --compress-images \"${file}\" \"compressed-${file}\""
##}

# Change format of ebooks (flatpak wrapper): arg1 = filename (eg: file.pdf), arg2 = newExtension (eg: epub) [optional]
##ebook-convert() {
##  local file
##  file="${1}"
##  if [[ -z "$2" ]]; then
##    echo "Converting to the same extension..."
##    flatpak --command="sh" run com.calibre_ebook.calibre -c "ebook-convert \"${file}\" \"converted-${file}\""
##  else
##    local extensionlessfile
##    extensionlessfile="${file%.*}"
##    local newextension
##    newextension="$2"
##    echo "Converting to ${newextension} extension..."
##    flatpak --command="sh" run com.calibre_ebook.calibre -c "ebook-convert \"${file}\" \"${extensionlessfile}.${newextension}\""
##  fi
##}

## vim: foldmethod=indent foldminlines=0 foldlevel=0
