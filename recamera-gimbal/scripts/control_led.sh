#!/bin/bash
# Simple LED control script for reCamera
ACTION=$1

if [ "$ACTION" = "on" ]; then
    VAL=1
elif [ "$ACTION" = "off" ]; then
    VAL=0
else
    echo "Usage: $0 on|off"
    exit 1
fi

# SSH command to control LED
ssh -o StrictHostKeyChecking=no recamera@192.168.31.198 "echo 'recamera.1' | sudo -S sh -c 'echo $VAL > /sys/class/leds/white/brightness'"