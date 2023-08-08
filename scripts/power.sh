#!/bin/zsh

options=("⏼   Shutdown" "🔄  Reboot" "🔓   Lock" "🔑  Logout" "🌙   Sleep")
selected_option=$(printf '%s\n' "${options[@]}" | bemenu -i -l 11 -p "" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb"  )

case $selected_option in
    "⏼   Shutdown")
        confirm_shutdown=$(printf "Yes\nNo" | bemenu -l 11 -p "Are you sure you want to Shutdown?" --fn "JetBrains Mono 14" --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb")
        if [ "$confirm_shutdown" = "Yes" ]; then
            exec systemctl poweroff
        fi
        ;;
    "🔄  Reboot")
        confirm_reboot=$(printf "Yes\nNo" | bemenu -l 11 -p "Are you sure you want to Reboot?" --fn "JetBrains Mono 14" --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb")
        if [ "$confirm_reboot" = "Yes" ]; then
            exec systemctl reboot
        fi
        ;;
    "🔓   Lock")
         confirm_lock=$(printf "Yes\nNo" | bemenu -l 11 -p "Are you sure you want to Lock?" --fn "JetBrains Mono 14" --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb")
        if [ "$confirm_lock" = "Yes" ]; then
            exec swaylock -c '#000000'
        fi
        ;;
    "🔑  Logout")
        confirm_logout=$(printf "Yes\nNo" | bemenu -l 11 -p "Are you sure you want to Logout?" --fn "JetBrains Mono 14" --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb")
        if [ "$confirm_logout" = "Yes" ]; then
            swaymsg exit
        fi
        ;;
    "🌙   Sleep")
        confirm_suspend=$(printf "Yes\nNo" | bemenu -l 11 -p "Are you sure you want to Suspend?" --fn "JetBrains Mono 14" --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb")
        if [ "$confirm_suspend" = "Yes" ]; then
            exec systemctl suspend
        fi
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
