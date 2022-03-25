#############################################################
# # # # # # # # # # # # FUNCTIONS # # # # # # # # # # # # # #
#############################################################
gping(){                 # Ping google with time
    ping 8.8.8.8 | while read -r pingout; do
        local datedping
        datedping="$(date +"[%T]"): ${pingout}"
        echo "${datedping/: *_/: }"
    done
}

mkcd(){                  # Make a directory and cd in it
    mkdir -p -- "$1" && cd -P -- "$1" || return
}

cla(){                   # cd then clean the screen and do la
    cd "$1" && clear && ls -AF
}

bnr(){                   # Bakcup or restore a file
    if [[ "$1" == *.bkp ]]; then
        echo "Restoring from bakup"
        cp "$1" "${1%.bkp}"
    else
        echo "Making backup"
	cp "$1" "${1}.bkp"
    fi
}

ra(){                    # Rm but asking if sure because rm -i sucks
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

randomchoice(){          # Choose from inputted values
    declare -a choices=( "$@" )
    echo "${choices[$(shuf -i 0-$(($#-1)) -n1)]}"
}

flipacoin(){             # Flip a coin
    [[ "$(shuf -i 1-2 -n1)" == "1" ]] && echo "head" || echo "tail"
}

extract() {              # Extract things with tar bunzip2 unrar gunzip unzip uncompress 7z
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
