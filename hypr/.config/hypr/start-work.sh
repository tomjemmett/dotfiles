#!/usr/bin/env bash

slack &
for ((i=0; i<25; i++)); do
  if hyprctl clients | grep -q "class: Slack"; then

    hyprctl dispatch movetoworkspacesilent 1,class:Slack
    break
  fi
  sleep 0.2
done


/opt/teams-for-linux/teams-for-linux &
for ((i=0; i < 25; i++)); do
  if hyprctl clients | grep -q "class: teams-for-linux"; then

    hyprctl dispatch movetoworkspacesilent 2,class:teams-for-linux
    break
  fi
  sleep 0.2
done

/opt/google/chrome/google-chrome --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn %U &
disown
for ((i=0; i < 25; i++)); do
  if hyprctl clients | grep -q "class: chrome-faolnafnngnfdaknnbpnkhgohbobgegn-Default"; then

    hyprctl dispatch movetoworkspacesilent 3,class:chrome-faolnafnngnfdaknnbpnkhgohbobgegn-Default
    break
  fi
  sleep 0.2
done

