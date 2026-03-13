#!/bin/bash

sensors -j | \
  jq -r ".\"it8689-isa-0a40\" | [.fan1.fan1_input, .fan2.fan2_input, .fan3.fan3_input, .fan4.fan4_input | floor] | join(\",\")"

