#!/bin/sh

mount /dev/nvme0n1p3 /mnt

mkdir -p /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi

swapon /dev/nvme0n1p2
