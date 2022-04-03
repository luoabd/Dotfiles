#!/bin/bash

# Filter events
if [ $PLAYER_EVENT = 'change' ]
then
	playerctl metadata mpris:artUrl | xargs wget -O /tmp/spotify_cover.jpg
	notify-send -i /tmp/spotify_cover.jpg \
		-a "`playerctl metadata artist`" \
		"`playerctl metadata title`" \
		-t 3000
fi
