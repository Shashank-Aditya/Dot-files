#!/bin/sh

# Function to toggle Wi-Fi on/off
toggle_wifi() {
    if [ "$1" = "on" ]; then
        # Command to turn on Wi-Fi (adjust the command according to your system)
        sudo ip link set wlan0 up
        echo "Wi-Fi turned on."
    elif [ "$1" = "off" ]; then
        # Command to turn off Wi-Fi (adjust the command according to your system)
        sudo ip link set wlan0 down
        echo "Wi-Fi turned off."
    fi
}

# Create a menu with Bemenu
choice=$(echo -e "on\noff" | bemenu -i -p "Wi-Fi controls:")

# Handle the selected option
case "$choice" in
    "on")
        toggle_wifi "on"
        ;;
    "off")
        toggle_wifi "off"
        ;;
    *)
        echo "Invalid option."
        ;;
esac
