#!/bin/bash -eu

DIST=$(find deploy -name 'image*lite.zip' | head -1)
if [ -z "$DIST" ]
then
  echo "No distribution found. Exiting."
  exit 1
fi

echo
echo "Currently mounted disks:"
diskutil list external | grep -A 2 external
DISK=$(diskutil list external | grep "/dev/disk" | head -1 | awk '{print $1}')

if [ -z "$DISK" ]
then
  echo "No external disk found. Exiting."
  exit 1
fi

echo
echo "Unmounting $DISK"
diskutil unmountDisk $DISK

RDISK=$(echo $DISK | sed 's/disk/rdisk/')
echo
echo "About to flash to raw $RDISK using:"
COMMAND="unzip -p $DIST | sudo dd of=$RDISK bs=4m"
echo "  " $COMMAND

echo
read -p "Are you sure? (press y to confirm)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo
  eval "$COMMAND"
fi
