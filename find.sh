#!/usr/bin/env bash
set -euo pipefail

DEFAULT_INTERFACE=$(route get google.com | grep interface | awk -F  ": " '{print $2}')

INTERFACE=${1:-$DEFAULT_INTERFACE}

IP=$(ifconfig $INTERFACE inet | grep inet | awk '{print $2}')
HEX_MASK=$(ifconfig $INTERFACE inet | grep netmask | awk '{print $4}' | cut -c 3- | tr [a-f] [A-F])
MASK=$(echo "obase=2; ibase=16; $HEX_MASK" | bc | tr -cd '1' | wc -c | awk '{print $1}')
NET=$(echo "$(echo $IP | cut -d '.' -f 1-3).0/$MASK")

echo "Using interface : $INTERFACE"
echo "Using IP : $IP"
echo "Scanning net: $NET"
sudo nmap -sn "$NET" | grep -B 2 Raspberry | grep "report for" | cut -c 22-
