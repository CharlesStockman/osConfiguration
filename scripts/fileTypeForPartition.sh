#/bin/sh

# Creates the files formt and assumes:
#    partition 1 is the UEFI boot
#    partition 2 is the swap
#    partition 3 is contains the OS
#
# -F -- Force

drive=/dev/nvme0np
partition1=${drive}1
partition2=${drive}2
partition3=${drive}3

mkfs.vfat -F 32 $partition1
fatlabel $partition1 "BOOT"

mkswap $partition2
swaplabel $partition2 "SWAP"

mkfs.ext4 -F $partition3
e2label $partition3 "Gentoo"
