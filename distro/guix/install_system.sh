#!/bin.sh

# Copy config.scm to the correct directory
mkdir -p /mnt/etc
cp config.scm /mnt/etc/config.scm

guix system init /mnt/etc/config.scm /mnt
