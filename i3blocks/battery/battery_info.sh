#!/bin/bash

# Get battery status
battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Get battery percentage
battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

# Emoji icons for battery status
if [ "$battery_status" = "Charging" ]; then
    battery_icon="⚡️"
elif [ "$battery_status" = "Discharging" ]; then
    if [ "$battery_percentage" -ge 90 ]; then
        battery_icon="🔋"
    elif [ "$battery_percentage" -ge 60 ]; then
        battery_icon="🔋🔋"
    elif [ "$battery_percentage" -ge 30 ]; then
        battery_icon="🔋🔋🔋"
    else
        battery_icon="🔋🔋🔋🔋"
    fi
else
    battery_icon="🔌"
fi

# Print the output
echo "$battery_icon $battery_percentage%"