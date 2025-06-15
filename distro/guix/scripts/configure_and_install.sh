#!/bin/sh

# Create config directory and move configuration file into the directory:
mkdir -p /mnt/etc
cp ../config/config.scm /mnt/etc/config.scm

guix system init /mnt/etc/config.scm /mnt
