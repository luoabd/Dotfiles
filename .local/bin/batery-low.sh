

POWERSUPPLY="/sys/class/power_supply/AC/online" # could be different on your system!
TOO_LOW=25 # how low is too low?
NOT_CHARGING="0"

export DISPLAY=:0

BATTERY_LEVEL=$(upower -d | grep -P -o '[0-9]+(?=%)' | tail -n 1)
STATUS=$(cat $POWERSUPPLY)

if [ $BATTERY_LEVEL -le $TOO_LOW -a $STATUS = $NOT_CHARGING ]
then
        /bin/dunstify -u critical -r 69420 'Low battery! Charge immediately!'
fi
