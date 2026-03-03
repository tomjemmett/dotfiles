#!/bin/bash

sensors -j | \
  jq -r ".\"dell_smm-isa-00de\" | [.fan1.fan1_input, .fan2.fan2_input | floor] | join(\",\")"

