#!/usr/bin/env bash

# The name or part of the name of your Bluetooth device
DEVICE_NAME="AirPods"

# Search for the device and get its MAC address
MAC_ADDRESS=$(bluetoothctl devices | grep -i "$DEVICE_NAME" | awk '{print $2}')

# Check if the MAC address was found
if [ -n "$MAC_ADDRESS" ]; then
    # Start bluetoothctl and connect to the device
    bluetoothctl connect $MAC_ADDRESS
else
    echo "No Bluetooth device with the name '$DEVICE_NAME' found."
fi
