#!/bin/bash

case $(hostname) in
  tj-arch)
    chip="it8689-isa-0a40"
    fanN=4
    ;;
  arch-laptop)
    chip="dell_smm-virtual-0"
    fanN=2
    ;;
  *)
    echo ""
    exit 1
    ;;
esac

sensors -j | jq -r --arg chip "$chip" --argjson n "$fanN" '
  [
    .[$chip]
    | with_entries(select(.key | test("^fan[0-9]+$"))) 
    | .[]
    | to_entries[]
    | select(.key | endswith("_input"))
    | .value
    | floor
  ][0:$n]
  | join(",")'

