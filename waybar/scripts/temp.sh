#!/bin/bash

sensors -j | \
  jq -r ".\"coretemp-isa-0000\".\"Package id 0\".\"temp1_input\" | floor"

