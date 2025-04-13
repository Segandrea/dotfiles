#!/usr/bin/env bash

shopt -s nullglob

declare wallpaper_dir_path="/home/$(whoami)/Pictures/Gnome/Wallpaper"
declare -a images=( "${wallpaper_dir_path}"/*.{jpg,png,jpeg,JPG,PNG,JPEG} )
declare wallpaper_of_the_day="${images[$(shuf --input-range=0-$((${#images[@]}-1)) --head-count=1)]}"

if [[ -n "${wallpaper_of_the_day}" ]]; then
  gsettings set org.gnome.desktop.background picture-uri "file://${wallpaper_of_the_day}" && \
    gsettings set org.gnome.desktop.background picture-uri-dark "file://${wallpaper_of_the_day}" && \
    gsettings set org.gnome.desktop.screensaver picture-uri "file://${wallpaper_of_the_day}" && \
    notify-send --app-name="Random wallpaper" --expire-time=2000 --icon="${wallpaper_of_the_day}" "the new wallpaper is '${wallpaper_of_the_day##*/}'"
else
  notify-send "Choose one of the wallpaper or download one and retry"
fi
