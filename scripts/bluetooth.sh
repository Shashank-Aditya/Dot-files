#!/bin/sh
beats_mac="2C:FD:B4:7C:0B:FB"
beats_sink="bluez_output.2C_FD_B4_7C_0B_FB.1"

#systemctl start bluetooth.service
bluetoothctl power on
bluetoothctl connect $beats_mac
pactl set-default-sink $beats_sink
