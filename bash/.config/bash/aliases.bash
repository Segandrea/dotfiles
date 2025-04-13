# The following directive deactivates shellcheck's warning for missing shebang
# shellcheck disable=SC2148

# Add color to ls with (F)iletype indicators (eg. / for directories, @ for links, = for sockets) and following a natural sorting order (v)
alias ls='ls -vF --color=auto'
# (l)ist informations on (A)ll files but . and .. in a (h)uman readable way
alias ll='ls -lah --time-style=long-iso'
# (l)ist informations on files in a (h)uman readable way
alias l='ls -lh --time-style=long-iso'
# show (A)ll files but . and ..
alias la='ls -A'
# (l)ist filenames in (c)olumns
alias lc='ls -A1'
# keep (R)aw colors when input piped
alias less='less -R'
# colored grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# grep from ps aux
alias psgrep='ps aux | head --lines=1; ps aux | grep -v "grep" | grep -i'
# grep from env
alias envgrep='env | grep -i'

# show git tree
alias gittree='git log --all --graph --decorate --oneline'
# use vimdiff to see differences in files
alias gd='git difftool --tool=vimdiff'

# (e)dit file with nvim
alias e='$EDITOR'

# source .bashrc
alias sbash='[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"'

# exit but with style
alias :q='exit'
alias :wq='exit'

# calm and gentle, don't be angry
alias buonanotte='poweroff'
alias suspend='systemctl suspend'
alias please='sudo $(history -p !!)'
alias cd..='cd ..'
alias cd...='cd ../..'
alias sl='ls'
alias al='la'
alias eco='echo'
alias quit='exit'
alias clear='clear -x'
alias cls='clear -x'
alias cla='clear -x && ls -AF'
alias wget='wget --hsts-file $XDG_STATE_HOME/wget/history'
alias path='echo -e "${PATH//:/\\n}"'
alias detach='tmux detach-client'

# compile c with @daddinuz's flames
alias ddc='gcc -std=c17 -Wall -Wextra -Wpedantic -Werror'

# NetworkManager shortcuts
alias nmlist='nmcli --fields "in-use,ssid,chan,rate,signal,security" device wifi list'
alias nmconn='nmcli device wifi connect "$(nmcli device wifi rescan && nmcli --get-values "ssid" device wifi list | fzf --no-info --border=rounded --prompt="Connect to: " --pointer="➜")"'

# fix for letting my drawing tablet go on second screen
# TODO: write a wayland version
alias huion2screen='xinput map-to-output 22 HDMI-2'

# clipboard shortcuts
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    alias toclip='wl-copy'
    alias fromclip='wl-paste'
else
    alias toclip='xclip -selection clipboard'
    alias fromclip='xclip -selection clipboard -o'
fi

# lock screen
alias lockscreen='dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock'

# spotify shortcuts MPRIS
alias sptnext='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next'
alias sptprev='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous'
alias spttoggle='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause'

# upgrade from pacman, aur, flatpak and other packages
# TODO: make me a function
alias upgradeall='sudo dnf upgrade && flatpak update && rustup update'

# dump, load or reset gnome settings
alias dconfdump='dconf dump / > '
alias dconfload='dconf load / < '
alias dconfreset='dconf reset -f /'

# navigation
alias go='cd'
alias goto='goi'

# my todo list
alias todo='tmux popup -E -w 80% -h 80% -b rounded "vim $DESKTOP_DIR/todo.md"'

# adb
alias adblist='adb shell pm list packages | sed "s/package://"'
alias adbdisable='adb shell pm disable-user --user 0' # NB. append package after this
alias adbenable='adb shell pm enable --user 0' # NB. append package after this
alias adbremove='adb shell pm uninstall --user 0' # NB. append package after this
