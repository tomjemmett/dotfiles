#!/bin/bash

EXTERNAL_COUNT=$(hyprctl monitors -j | jq '[.[] | select(.name != "eDP-1")] | length')

if [ "$EXTERNAL_COUNT" -gt 0]; then
	hyprctl keyword monitor eDP-1,disable
else
	hyprctl keyword monitor eDP-1,preferred,auto,1
fi
