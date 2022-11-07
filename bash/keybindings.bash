#!/usr/bin/env bash

# ".inputrc" is used to define keybindings for readline-based programs
# Bash dependant bindings can't be run in other readline-based programs
# (Eg. bash functions can't be called inside the python interpreter)
#
# The keybindings defined here only work inside bash shell

# Bind Ctrl+g to `goto()`
bind -m vi-insert '"\C-g":"goto && clear\n"'
bind -m vi-command '"\C-g":"igoto && clear\n"' # 'i' is to enter insert

# Bind Ctrl+h to `gethelp()`
bind -m vi-insert '"\C-h":"gethelp && clear\n"'
bind -m vi-command '"\C-h":"igethelp && clear\n"'
