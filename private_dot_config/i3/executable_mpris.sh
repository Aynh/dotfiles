#!/usr/bin/env bash

format_seconds() {
	declare -n ret=$2
	ret=$(date -ud @$1 "+%H:%M:%S")
}

media_title() {
	declare -n ret=$1
	ret=$(playerctl metadata title)
}

navigate() {
	case $1 in
		prev) playerctl previous ;;
		next) playerctl next ;;
	esac

	notify 
}

notify() {
	media_title title
	# dunstify --urgency=low --icon=multimedia-player --timeout 500 --hints=string:x-dunst-stack-tag:playerctl "$title" "$@"
}

seek() {
	case $1 in
		forward) playerctl position 10+ ;;
		backward) playerctl position 10- ;;
		*) return ;;
	esac

	show_progress
}

show_progress() {
	current=$(playerctl position)
	max=$(bc <<< "$(playerctl metadata mpris:length) / 1000000")
	progress=$(bc -l <<< "$current/$max*100" | cut -d "." -f1)

	format_seconds $current t_current
	format_seconds $max t_max
	notify "Progress: $t_current/$t_max" --hints=int:value:$progress
}

stop() {
	playerctl stop

	notify "State: Stopped"
}

toggle_loop() {
	current=$(playerctl loop)
	case $current in
		None) playerctl loop Track ;;
		Track) playerctl loop Playlist ;;
		Playlist) playerctl loop None ;;
	esac

	notify "Loop: $(playerctl loop)"
}

toggle_pause() {
	playerctl play-pause

	notify "State: $(playerctl status)"
}

# not working on MPV
toggle_shuffle() {
	playerctl shuffle toggle

	notify "$(playerctl shuffle)"
}

volume() {
	case $1 in
		up) playerctl volume 0.02+ ;;
		down) playerctl volume 0.02- ;;
		*) return ;;
	esac

	current=$(bc <<< "$(playerctl volume)*100" | cut -d "." -f1)

	notify "Volume: $current" --hints=int:value:$current
}

case $1 in
	toggle_loop) toggle_loop ;;
	toggle_pause) toggle_pause ;;
	# toggle_shuffle) toggle_shuffle ;;
	stop) stop ;;
	next) navigate next ;;
	previous) navigate prev ;;
	seek_backward) seek backward ;;
	seek_forward) seek forward ;;
	volume_up) volume up ;;
	volume_down) volume down ;;
	show_progress) show_progress ;;
esac
