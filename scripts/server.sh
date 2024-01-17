#!/bin/bash
#
# This script is here so I don't have to keep typing in the same command over
# and over again.

IPAddress="$(ip a | awk '/192.168/ {print $2}' | head -n1 | sed 's/\/.*//g')"

[ -z "$1" ] && Port=8080 || Port="$1"

printf "http://$IPAddress:$Port" | xclip -i -selection clipboard
python3 -m http.server --bind $IPAddress $Port
