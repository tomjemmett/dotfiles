#!/usr/bin/env bash

slack &
for ((i=0; i<25; i++)); do
  if hyprctl clients | grep -q "class: Slack"; then

    hyprctl dispatch 'hl.dsp.window.move({workspace = 1, window = "class:slack", follow = false })'
    break
  fi
  sleep 0.2
done


/opt/teams-for-linux/teams-for-linux &
for ((i=0; i < 25; i++)); do
  if hyprctl clients | grep -q "class: teams-for-linux"; then

    hyprctl dispatch 'hl.dsp.window.move({workspace = 2, window = "class:teams-for-linux", follow = false })'
    break
  fi
  sleep 0.2
done

/opt/google/chrome/google-chrome --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn %U &
disown
for ((i=0; i < 25; i++)); do
  if hyprctl clients | grep -q "class: chrome-faolnafnngnfdaknnbpnkhgohbobgegn-Default"; then

    hyprctl dispatch 'hl.dsp.window.move({workspace = 3, window = "class:chrome-faolnafnngnfdaknnbpnkhgohbobgegn-Default", follow = false })'
    break
  fi
  sleep 0.2
done

