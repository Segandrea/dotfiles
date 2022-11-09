#!/usr/bin/env bash

# ".inputrc" is used to define keybindings for readline-based programs
# Bash dependant bindings can't be run in other readline-based programs
# (Eg. bash functions can't be called inside the python interpreter)
#
# The keybindings defined here only work inside bash shell
#
# INFO: The string containing the keybinding should always be prefixed with
#       `\C-c\n` which stands for `<Ctrl-c><Return>`.
#       Doing this avoid the concatenation of the command with eventual
#       dangling strings.

# Bind Ctrl+g to `goto()`
bind -m vi-insert '"\C-g":"\C-c\ngoto && clear\n"'
bind -m vi-command '"\C-g":"\C-c\ngoto && clear\n"' # 'i' is to enter insert

# Bind Ctrl+h to `gethelp()`
bind -m vi-insert '"\C-h":"\C-c\ngethelp && clear\n"'
bind -m vi-command '"\C-h":"\C-c\ngethelp && clear\n"'
