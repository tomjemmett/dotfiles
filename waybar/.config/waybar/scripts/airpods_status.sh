#!/usr/bin/env bash

# The name or part of the name of your Bluetooth device
DEVICE_NAME="AirPods"

# Search for the device and get its MAC address
MAC_ADDRESS=$(bluetoothctl devices | grep -i "$DEVICE_NAME" | awk '{print $2}')

# Check if the MAC address was found
if [ -n "$MAC_ADDRESS" ]; then
    # check whether connected or not
    STATUS=$(bluetoothctl info $MAC_ADDRESS | grep Connected | awk '{print $2}')
else
    STATUS="not found"
fi

case "$STATUS" in
  "yes")
      ICON=""
      ;;
  "no")
      ICON="X"
      ;;
  *)
      ICON="?"
      ;;
esac

echo " $ICON"
