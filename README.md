# onecable pi-gen

Tool used to create a Raspbian image, focused on creating a secure image to run a headless Pi.

I'm calling the distribution onecable, since the goal is to never connect more than one cable to the Pi during the setup procedure.

## Requirements

* Docker

## Configuration

Run `./config.sh`. It will ask you for
* the first user's name and
* password and
* public ssh key

It will also set some defaults, especially
* allowing logins only via SSH

```
$./config.sh
Username: john
Password:
SSH:

Deleting old config ./config

IMG_NAME=onecable
TIMEZONE_DEFAULT=Europe/Amsterdam
LOCALE_DEFAULT="en_US.UTF-8"

TARGET_HOSTNAME="node0"
ENABLE_SSH=1
PUBKEY_SSH_FIRST_USER="..."
PUBKEY_ONLY_SSH=1

FIRST_USER_NAME="bee"
FIRST_USER_PASS="********"

Config written to ./config

Skipping stage3 to stage 5
```

## Usage

Build the image (~20 minutes)

```
./build-docker.sh
```

Flash onto external drive

```
./flash.sh
```

The script will assume only a single mounted external drive and will ask you to confirm. Make *sure* that it is writing to the correct drive!

## Troubleshooting

### E: Unable to fetch some archives

There were probably some connectivity issues during the build time. You can continue via

```
#bash
CONTINUE=1 ./build-docker.sh

#fish
env CONTINUE=1 ./build-docker.sh
```
