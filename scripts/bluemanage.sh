#!/bin/sh

# Ask for the main option: "Bluetooth"
main_option=("On" "Off" "Cancel")
selected_main=$(printf '%s\n' "${main_option[@]}" | bemenu -i -l 3 -p "Select Bluetooth state:" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb")

case $selected_main in
    "On")
        bluetoothctl power on
        beats_mac="2C:FD:B4:7C:0B:FB"
        beats_sink="bluez_output.2C_FD_B4_7C_0B_FB.1"
        bluetoothctl connect $beats_mac
        pactl set-default-sink $beats_sink
        ;;
    "Off")
        bluetoothctl power off
        ;;
    "Cancel")
        exit
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
