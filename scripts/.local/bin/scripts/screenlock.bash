#!/usr/bin/env bash

# Poweroff bluetoothctl when the screen is locked
# then power it on again when the screen is unlocked
# trying to reconnect automatically to all the bluetooth
# devices that were connected before.
#
# NOTE: there is no need to launch it, it should be launched at startup

declare is_unlocked=true
declare connected_devices
dbus-monitor --session "type='signal',interface='org.gnome.ScreenSaver'" |
  while read -r is_locking; do
    case "${is_locking}" in
      *"boolean true"*)
        if $is_unlocked; then
          is_unlocked=false
          dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
          connected_devices="$(bluetoothctl devices Connected | awk '{print $2}')"
          bluetoothctl power off
        fi
      ;;
      *"boolean false"*)
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
