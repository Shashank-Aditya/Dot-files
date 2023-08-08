#!/bin/sh

option_a=(
    "Full Screen"
    "Select Screen"
)

option_b=(
    "Full Screen"
    "Select Screen"
)

option_b_fullscreen=(
    "No Sound"
    "Only Internal Sounds"
    "Only Mic sounds"
    "All Sounds"
)

option_b_selectscreen=(
    "No Sound"
    "Only Internal Sounds"
    "Only Mic sounds"
    "All Sounds"
)

option_c=(
    "Show Webcam"
    "Record Webcam"
    "Record Webcam with sound"
)

option_d=(
    "No Sound"
    "Only Internal Sounds"
    "Only Mic Sounds"
    "All Sounds"
)

#choice=$(echo -e "Screenshot\nScreen Record\nWebcam Record\nScreen & Webcam Record" | bemenu  -p "Select an option:" -i -l 11 -p "" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb" --nb "#000000")
choice=$(echo -e "Screenshot\nScreen Record\nWebcam Record\nScreen & Webcam Record" | wofi -d)

case "$choice" in
    "Screenshot")
        selected=$(printf '%s\n' "${option_a[@]}" | wofi -d)
        case "$selected" in
            "${option_a[0]}")
                grim screenshot.png
                ;;
            "${option_a[1]}")
                grim -g "$(slurp)" screenshot.png
                ;;
            *)
                echo "Invalid option for Screenshots."
                exit 1
                ;;
        esac
        ;;
    "Screen Record")
        selected=$(printf '%s\n' "${option_b[@]}" | bemenu  -p "Select an option:" -i -l 11 -p "" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb" --nb "#000000")
        case "$selected" in
            "${option_b[0]}") # Full Screen
                selected_sound=$(printf '%s\n' "${option_b_fullscreen[@]}" | bemenu  -p "Select an option:" -i -l 11 -p "" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb" --nb "#000000")
                case "$selected_sound" in
                    "${option_b_fullscreen[0]}")
                        foot -e sh -c 'wf-recorder -f recording.mp4'
                        ;;
                    "${option_b_fullscreen[1]}")
                        pactl set-default-source alsa_output.pci-0000_00_1f.3.analog-stereo.monitor; foot -e sh -c 'wf-recorder -a -f recording.mp4'
                        ;;
                    "${option_b_fullscreen[2]}")
                        notify-send "Turn on Bluetooth"; pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo; foot -e sh -c 'wf-recorder -a -f recording.mp4'
                        ;;
                    "${option_b_fullscreen[3]}")
                        notify-send "Turn off Bluetooth"; pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo; foot -e sh -c 'wf-recorder -a -f recording.mp4'
                        ;;
                    *)
                        echo "Invalid option for Screen Recording (Full Screen)."
                        exit 1
                        ;;
                esac
                ;;
            "${option_b[1]}") # Select Screen
                selected_sound=$(printf '%s\n' "${option_b_selectscreen[@]}" | bemenu  -p "Select an option:" -i -l 11 -p "" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb" --nb "#000000")
                case "$selected_sound" in
                    "${option_b_selectscreen[0]}")
                       selected_area="$(slurp)"; foot -e sh -c "wf-recorder -g '$selected_area' -f recording.mp4"
                        ;;
                    "${option_b_selectscreen[1]}")
                       pactl set-default-source alsa_output.pci-0000_00_1f.3.analog-stereo.monitor; selected_area="$(slurp)"; foot -e sh -c "wf-recorder -a -g '$selected_area' -f recording.mp4"
                        ;;
                    "${option_b_selectscreen[2]}")
                        notify-send "Turn on Bluetooth"; pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo;selected_area="$(slurp)"; foot -e sh -c "wf-recorder -a -g '$selected_area' -f recording.mp4"
                        ;;
                    "${option_b_selectscreen[3]}")
                       notify-send "Turn off Bluetooth";selected_area="$(slurp)"; pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo; foot -e sh -c "wf-recorder -g '$selected_area' -a -f recording.mp4"
                        ;;
                    *)
                        echo "Invalid option for Screen Recording (Select Screen)."
                        exit 1
                        ;;
                esac
                ;;
            *)
                echo "Invalid option for Screen Record."
                exit 1
                ;;
        esac
        ;;
    "Webcam Record")
        selected=$(printf '%s\n' "${option_c[@]}" | bemenu  -p "Select an option:" -i -l 11 -p "" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb" --nb "#000000")
        case "$selected" in
            "${option_c[0]}")
                foot -e sh -c 'ffplay -f v4l2 -fflags +nobuffer -i /dev/video0 -vf "hflip"'
                ;;
            "${option_c[1]}")
                foot -e sh -c 'ffmpeg -f v4l2 -i /dev/video0 -c:v h264 -preset ultrafast output.mp4'
                ;;
            "${option_c[2]}")
                foot -e sh -c 'ffmpeg -f v4l2 -i /dev/video0 -f pulse -i default -c:v h264 -preset ultrafast output.mp4'
                ;;
            *)
                echo "Invalid option for Webcam Recording."
                exit 1
                ;;
        esac
        ;;
    "Screen & Webcam Record")
        selected=$(printf '%s\n' "${option_d[@]}" | bemenu  -p "Select an option:" -i -l 11 -p "" --fn "JetBrains Mono 14" --line-height 30 --tb "#285577" --hb "#285577" --tf "#eeeeee" --hf "#eeeeee" --nf "#bbbbbb" --nb "#000000")
        case "$selected" in
                "${option_d[0]}")
                       swaymsg "exec foot -t 'ffplay' -e sh -c 'ffplay -f v4l2 -fflags +nobuffer -i /dev/video0 -vf "hflip"'"; foot -e sh -c 'wf-recorder -f recording.mp4'
                        ;;
                 "${option_d[1]}")
                        swaymsg "exec foot -t 'ffplay' -e sh -c 'ffplay -f v4l2 -fflags +nobuffer -i /dev/video0 -vf "hflip"'";pactl set-default-source alsa_output.pci-0000_00_1f.3.analog-stereo.monitor;foot -e sh -c 'wf-recorder -a -f recording.mp4'
                       ;;
                  "${option_d[2]}")
                        swaymsg "exec foot -t 'ffplay' -e sh -c 'ffplay -f v4l2 -fflags +nobuffer -i /dev/video0 -vf "hflip"'"; pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo;  foot -e sh -c 'wf-recorder -a -f recording.mp4'
                       ;;
                  "${option_d[3]}")
                         swaymsg "exec foot -t 'ffplay' -e sh -c 'ffplay -f v4l2 -fflags +nobuffer -i /dev/video0 -vf "hflip"'";pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo;foot -e sh -c 'wf-recorder -a -f recording.mp4'
                       ;;
            *)
                echo "Invalid option for Both with screen recording + webcam."
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Invalid option."
        exit 1
        ;;
esac
