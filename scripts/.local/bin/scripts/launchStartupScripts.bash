#!/usr/bin/env bash

###
# Launch the scripts in startup-scripts/
#
# NOTE: there is no need to launch this program, gnome launches it at startup

cd "$HOME/.local/bin/scripts/startup/"

for file in $(ls); do
  [[ "$(file ${file})" =~ "executable" ]] && ./"${file}"
done
