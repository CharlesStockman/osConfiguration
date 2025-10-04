#!/bin/sh

# Creates the files format and assumes:
#     partition 1 is the UEFI boot,
#     partition 2 is the swap
#     partition 3 contains the OS 
#
# -F 32 -- FAT32 (modern FAT variant, supports larger partitions and files)

if [ $# -gt 1 ]; then
   echo "$0 -- Must contain zero or one argument.  Argument is the label of the disk containing the Operating System"
   exit -1
fi

if [ $# -eq 0 ]; then
   echo "$0 -- No label has been provided for the drive.  It is advisable to supply a label"
fi

drive=/dev/nvme0n1p
partition1=${drive}1
partition2=${drive}2
partition3=${drive}3

mkfs.vfat -F 32 $partition1 
fatlabel $partition1 "BOOT"

mkswap $partition2 
swaplabel $partition2 "SWAP"

mkfs.ext4 -F $partition3 
e2label $partition3 $1

