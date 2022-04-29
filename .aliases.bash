# Add color to ls with (F)iletype indicators (eg. / for directories, @ for links, = for sockets) and following a natural sorting order (v)
alias ls='ls -vF --color=auto'
# (l)ist informations on (A)ll files but . and .. in a (h)uman readable way
alias ll='ls -lah --time-style=long-iso'
# (l)ist informations on files in a (h)uman readable way
alias l='ls -lh --time-style=long-iso'
# show (A)ll files but . and ..
alias la='ls -A'
# keep (R)aw colors when input piped
alias less='less -R'
# colored grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# ps grepping something
alias psgrep='ps aux | grep'

# show git tree
alias gittree='git log --all --graph --decorate --oneline'
# use vimdiff to see differences in files
alias gd='git difftool'

# go to places
alias documents='cd "${HOME}/Documents"'
alias downloads='cd "${HOME}/Downloads"'
alias desktop='cd "${HOME}/Desktop"'
alias pictures='cd "${HOME}/Pictures"'
alias videos='cd "${HOME}/Videos"'
alias configurations='cd "${HOME}/.config"'
alias dotfiles='cd "${HOME}/Workspaces/dotfiles"'
alias workspaces='cd "${HOME}/Workspaces"'

# (e)dit file with nvim
alias e='nvim'
# vim can't use system clipboard in wayland, using nvim instead
alias vim='nvim -u "${HOME}/.vimrc"'
# edit configuration files
alias evim='vim "${HOME}/.vimrc"'

# exit but with style
alias :q='exit'
alias :wq='exit'

# calm and gentle, don't be angry
alias please='sudo $(history -p !!)'
alias cd..='cd ..'
alias cd...='cd ../..'
alias sl='ls'
alias al='la'
alias eco='echo'
alias quit='exit'
alias cls='clear'

# compile c with @daddinuz flames
alias ddc='gcc -std=c17 -Wall -Wextra -Wpedantic -Werror'

# NetworkManager shortcuts
alias nmlist='nmcli device wifi list'

# fix for letting my drawing tablet go on second screen
#TODO: write a wayland version
alias huion2screen='xinput map-to-output 22 HDMI-2'

# xclip shortcuts
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

# upgrade pacman, aur and flatpak packages
alias upgradeall='yay -Syu && flatpak update'

# connect and disconnect sony wf-c500
alias btcs='bluetoothctl power on && bluetoothctl connect $(bluetoothctl paired-devices | sed "s/^Device \(.*\) WF-C500$/\1/")'
alias btds='bluetoothctl disconnect $(bluetoothctl paired-devices | sed "s/^Device \(.*\) WF-C500$/\1/")'

# dump and load  settings
alias dconfdump='dconf dump / > DUMPEDSETTINGS.ini'
alias dconfload='dconf load / < settings.ini'
