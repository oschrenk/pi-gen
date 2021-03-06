#!/bin/bash -eu
read -p 'Username: ' FIRST_USER_NAME
read -sp 'Password: ' FIRST_USER_PASS
echo
read -sp 'SSH: ' FIRST_USER_SSH
echo
read -p 'hostname: ' TARGET_HOSTNAME

echo
echo "Deleting old config ./config"
rm -f config

echo
echo 'IMG_NAME=onecable' | tee -a config
echo 'TIMEZONE_DEFAULT=Europe/Amsterdam' | tee -a config
echo 'LOCALE_DEFAULT="en_US.UTF-8"' | tee -a config

echo
echo "TARGET_HOSTNAME=\"$TARGET_HOSTNAME\"" | tee -a config
echo 'ENABLE_SSH=1' | tee -a config
echo "PUBKEY_SSH_FIRST_USER=\"$FIRST_USER_SSH\"" | tee -a config
echo 'PUBKEY_ONLY_SSH=1' | tee -a config
echo

echo "FIRST_USER_NAME=\"$FIRST_USER_NAME\"" | tee -a config
echo "FIRST_USER_PASS=\"********\""
echo "FIRST_USER_PASS=\"$FIRST_USER_PASS\"" >> config

echo
echo "Config written to ./config"

# only build raspbian lite derivation
echo
echo "Skipping stage3 to stage 5"
touch ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
