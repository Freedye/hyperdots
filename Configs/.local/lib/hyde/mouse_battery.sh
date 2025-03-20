#!/bin/bash

output=$(rivalcfg --battery-level)

if echo "$output" | grep -q "Unable to get the battery level"; then
    echo "{\"text\": \"--\"}"
elif echo "$output" | grep -q "E: No supported device found."; then
    echo "{\"text\": \"--\"}"
else
    echo "{\"text\": \"$(rivalcfg --battery-level | awk '{print $(NF-1)}')\"}"
fi
