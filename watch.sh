#!/usr/bin/env sh
# Script to automatically run `make localinstall` on file change. Requires inotify-tools to work

inotifywait -m -e MODIFY wsb.bbx | while read file event; do
    make localinstall
done
