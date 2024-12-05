#!/usr/bin/env bash

# Poweroff bluetoothctl when the screen is locked, also pause
# gnome-pomodoro and spotify then resume gnome-pomodoro and restart
# bluetooth on screen unlock reconnecting all the bluetooth devices
# that were connected before.
#
# NOTE: there is no need to launch it, this is a script launched at startup

declare is_unlocked=true
declare connected_devices
# monitor gnome screensaver to know when screen is locked
dbus-monitor --session "type='signal',interface='org.gnome.ScreenSaver'" |
  while read -r is_locking; do
    case "${is_locking}" in
      *"boolean true"*)
        # this "if" is needed because the signal is doubled
        if $is_unlocked; then
          is_unlocked=false
          # Stop spotify
          dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
          connected_devices="$(bluetoothctl devices Connected | awk '{print $2}')"
          bluetoothctl power off
        fi
      ;;
      *"boolean false"*)
        # this "if" is needed because the signal is doubled
        if ! $is_unlocked; then
          is_unlocked=true
          bluetoothctl power on
          sleep 5
          for device in $connected_devices; do
            bluetoothctl connect "${device}"
          done
        fi
      ;;
    esac
  done
