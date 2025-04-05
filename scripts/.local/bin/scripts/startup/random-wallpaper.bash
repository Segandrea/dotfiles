#!/usr/bin/env bash

shopt -s nullglob

declare -a images=( "$PICTURES_DIR/Gnome/Wallpaper"/*.{jpg,png,jpeg,JPG,PNG,JPEG} )
declare wallpaper_of_the_day="${images[$(shuf --input-range=0-$((${#images[@]}-1)) --head-count=1)]}"

if [[ -n "${wallpaper_of_the_day}" ]]; then
  gsettings set org.gnome.desktop.background picture-uri "file://${wallpaper_of_the_day}" && \
    gsettings set org.gnome.desktop.background picture-uri-dark "file://${wallpaper_of_the_day}" && \
    gsettings set org.gnome.desktop.screensaver picture-uri "file://${wallpaper_of_the_day}" && \
    echo "the new wallpaper is ${wallpaper_of_the_day}"
else
  echo "Choose one of the wallpaper or download one and retry"
fi
