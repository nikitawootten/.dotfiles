#!/usr/bin/env bash

STATUS="$(hostname) |"

#IPADDR=$(hostname -i | cut -d " " -f1)

# battery (if BAT0 exists)
BATT_PATH=/sys/class/power_supply/BAT0
[ -d "$BATT_PATH" ] && STATUS="$STATUS $(cat $BATT_PATH/status) $(cat $BATT_PATH/capacity)% |"

# formatted date
STATUS="$STATUS $(date +'%Y-%m-%d %l:%M:%S %p')"

echo $STATUS

