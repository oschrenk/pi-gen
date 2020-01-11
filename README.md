# onecable pi-gen

Tool used to create a Raspbian image, focused on creating a secure image to run a headless Pi.

I'm calling the distribution onecable, since the goal is to never connect more than one cable to the Pi during the setup procedure.

## Requirements

* Docker

## Configuration

Run `./config.sh`. It will ask you for the first user's name and password and set some defaults.

```
$./config.sh
Username: john
Password:

Deleting old config ./config

IMG_NAME=onecable
TIMEZONE_DEFAULT=Europe/Amsterdam
LOCALE_DEFAULT="en_US.UTF-8"
FIRST_USER_NAME="john"
FIRST_USER_PASS="********"

Config written to ./config

Skipping stage3 to stage 5

```

## Usage

```
./build-docker.sh
```
