#!/bin/bash
Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome
# Xephyr -fullscreen :5 & sleep 1 ; DISPLAY=:5 awesome