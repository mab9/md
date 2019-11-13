#!/bin/bash

HISTFILE=~/.bash_history
set -o history
history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3, $4, $5}' | sort | uniq -c | sort -nr | head -n 20

