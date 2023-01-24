#!/usr/bin/env bash
# Generates a Hyprland configuration that sources all files in a directory
# In your Hyprland config, add the following two lines (order here matters):
# exec = ~/.config/hypr/scripts/gen_sourcelist.sh # or wherever you put this script
# source ~/.config/hypr/hyprland_sourceme.conf

# The path to search for available files
HYPRLAND_D_LOC=~/.config/hypr/hyprland.d/
# The path to write the configuration file
OUTPUT_LOC=~/.config/hypr/hyprland_sourceme.conf

find $HYPRLAND_D_LOC -type f,l -printf "source=${HYPRLAND_D_LOC}%f\n" > $OUTPUT_LOC
