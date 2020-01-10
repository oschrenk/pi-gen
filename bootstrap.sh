#!/bin/bash -eu
echo "IMG_NAME=onecable" > config

# only build raspbian lite derivation
touch ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
