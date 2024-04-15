# Update : I have decided to stop working on slackware since I really do need up to date version of certain libraries such as Python.  In the future, I will be using distrobox to create a slackware distro to enjoy once and while 

# Assume these are not working yet.  I know installSoftware.sh does need some work.

## Introduction
The purpose to describe the scripts that will used to install the software and configure the system 
for a slackware 15.0 distribution.

## Prerequisite
A new version of slackware 15.0 installed and the scripts must be excecuted as the user root.
Directly after installing the software and before reboot exit to a shell and do the following:

### Setup chroot into the OS on the harddrive ( not the USB Stick)
chroot /mnt/os /mnt

## Setup mount the drive the configuraiton scripts
mkdir /mnt/transfer
mount /dev/sda1 /mnt/transfer

## Scripts
Should be executed in the following order.

| Script                    | Description                                      |
| :------------------       | :---------:                                      |
| **Post Installation**     |                                                  |
| adduser.sh                | Add a normal to the systeem.  Need one parameter login|
| giveUsersRootAccess.sh    | Allows normal user to execute root commands      |  
| uncommentCurrentMirror.sh | Does not work yet                                |
| ** Upgrade to current**   |                                                  |
| writeBlockers.sh          | Block the kernel from being updated              |
| update.sh                 | Updates the Slackware distro                     |
| installSBOTools.sh        | Install SBO Tools to install new software        |
| installNvidia.sh          | Does not work with Hyprland yet                  |
| installSoftware.sh        | Install Software need for work and entertainment |
| oneTimeConfigure.sh       | Execute commands needed after installation       |
| configure.sh              | Execute commands needed when a shell is started  |
