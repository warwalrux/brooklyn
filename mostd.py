#!/usr/bin/env bash

sleep_period=30s 

while true; do
    until top -bn 2 -d 0.01 | sed -nrs '8p' | awk '{if($9>5){exit 1}else{exit 0}}'; do
      xdotool mousemove_relative 0 1
      xdotool mousemove_relative 0 -1
      sleep ${sleep_period}
    done
   sleep ${sleep_period}
done
