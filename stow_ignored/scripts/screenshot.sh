#!/bin/bash

if [ ! -d ~/Pictures ]; then
  mkdir ~/Pictures
fi

save_location="$HOME/Pictures/screenshot-$(date +'%Y-%m-%d-%H:%M:%S').png"

grim -g "$(slurp)" - | tee "${save_location}" | wl-copy 

notify_ret=$(notify-send -t 5000 --action="open=Open save location" --action="dismiss=Dismiss" "Took Screenshot!" "Copied to clipboard and saved to:\n${save_location}")

if [[ "$notify_ret" == "open" ]]; then
  thunar "$save_location"
fi
