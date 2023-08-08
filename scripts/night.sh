#!/bin/sh

# Function to show bemenu with options and execute the selected command
show_bemenu() {
    local options=("On" "Off")
    local selected_option=$(printf '%s\n' "${options[@]}" | bemenu -p -i -l 11 -p "Gammastep: " --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb" --nb "#000000" 10)

    case "$selected_option" in
        "On")
            gammastep_on
            ;;
        "Off")
            gammastep_off
            ;;
        *)
            exit 1
            ;;
    esac
}

# Function to turn Gammastep on
gammastep_on() {
    gammastep -o -O 2500 -P
}

# Function to turn Gammastep off
gammastep_off() {
    pkill -SIGINT gammastep
}

# Main script starts here
show_bemenu
