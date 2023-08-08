#!/bin/sh

confirm_options=("Yes" "No")
selected_option=$(printf '%s\n' "${confirm_options[@]}" | bemenu -i -l 2 -p "Power Off?" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb")

case $selected_option in
    "Yes")
        bluetoothctl power off
        ;;
    "No")
        exit
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
