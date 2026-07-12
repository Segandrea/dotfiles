#!/usr/bin/env bash

shopt -s nullglob

declare wallpaper_dir_path="${HOME}/Pictures/Gnome/Wallpaper"
declare -a images=( "${wallpaper_dir_path}"/*.{jpg,png,jpeg,JPG,PNG,JPEG} )

if [[ "${XDG_CURRENT_DESKTOP}" == *GNOME* ]] && (( ${#images[@]} > 0 )); then

  declare wallpaper_of_the_day="${images[RANDOM % ${#images[@]}]}"

  if gsettings set org.gnome.desktop.background picture-uri "file://${wallpaper_of_the_day}" && \
     gsettings set org.gnome.desktop.background picture-uri-dark "file://${wallpaper_of_the_day}" && \
     gsettings set org.gnome.desktop.screensaver picture-uri "file://${wallpaper_of_the_day}"
  then
    notify-send "Wallpaper changed."
  else
    notify-send "Unable to change the wallpaper."
  fi
fi
