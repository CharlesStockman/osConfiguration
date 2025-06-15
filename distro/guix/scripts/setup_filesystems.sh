#!/bin/sh

boot="/dev/nvme0n1p1"
swap="/dev/nvme0n1p2"
work="/dev/nvme0n1p3"

mount $work /mnt

mkdir -p /mnt/boot/efi
mount $boot /mnt/boot/efi

mkswap $swap 
swapon $swap
