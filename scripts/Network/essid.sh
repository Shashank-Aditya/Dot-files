#!/bin/sh

# Check if Ethernet is connected
if [[ $(cat /sys/class/net/enp0s20f0u3/carrier) == 1 ]]; then
    ip_addr=$(ip -4 addr show enp0s20f0u3 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | awk 'NR==1')
    echo "$ip_addr "
# If Ethernet is not connected, check Wi-Fi
else
    essid=$(iwconfig wlan0 | awk -F'"' '/ESSID:/{print $2}' | awk '{print $1}')
    if [ -z "$essid" ]; then
        echo "Disconnected ⚠️"
    else
        echo "$essid  "
    fi
fi

# Handle left-click event
if [ "$BLOCK_BUTTON" -eq 1 ]; then
    # Left-click - Execute the specified command
    sh /usr/local/bin/Scripts/Network/wifi-connect.sh
fi
