#!/usr/bin/env bash

STATUS="$(cat /etc/hostname) |"

# battery (if BAT1 exists)
BATT_PATH=/sys/class/power_supply/BAT1
[ -d "$BATT_PATH" ] && STATUS="$STATUS $(cat $BATT_PATH/status) $(cat $BATT_PATH/capacity)% |"

# formatted date
STATUS="$STATUS $(date +'%Y-%m-%d %l:%M:%S %p')"

echo $STATUS

