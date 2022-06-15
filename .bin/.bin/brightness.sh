#!/bin/bash

# getting the current card name
card=$(ls /sys/class/backlight)

current_brightness=$(light -G)

printf '%.*f' 0 $current_brightness
 