#!/bin/bash

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
pkill -u $USER -USR1 dunst
# -n No forkin prevents dunst notfications from showing however it prevents locking on suspend
$(i3lock -n -i /tmp/screen.png \
	--inside-color=373445ff --ring-color=ffffffff --line-uses-inside \
	--keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
    	--insidever-color=fecf4dff --insidewrong-color=d23c3dff \
	--ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+86:y+1003" \
	--radius=15 --verif-text="" --wrong-text="" && pkill -u $USER -USR2 dunst) &
sleep 1
rm /tmp/screen.png
#pkill -u $USER -USR2 dunst
