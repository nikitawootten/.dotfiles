#!/usr/bin/env bash

set -eu

swww init

WALLPAPERS_LOC=~/Pictures/wallpapers
SLEEP_DURATION=5m
SWW_ARGS="--transition-type wipe --transition-angle 30 --transition-step 90"

while true
do
    for wallpaper in $(find $WALLPAPERS_LOC -type f,l | shuf)
    do
        echo $wallpaper
        swww img $SWW_ARGS $wallpaper
        sleep $SLEEP_DURATION
    done

    sleep $SLEEP_DURATION
done

