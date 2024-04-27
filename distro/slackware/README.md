# Update: I have decide to upgrade to another distro
# Assume these are not working yet.  I know installSoftware.sh does need some work.

## Introduction
The purpose to describe the scripts that will used to install the software and configure the system 
for a slackware 15.0 distribution.

## Prerequisite
A new version of slackware 15.0 installed and the scripts must be excecuted as the user root.

## Scripts
Should be executed in the following order.

| Script                    | Description                                                        |
| :------------------       | :---------:                                                        |
| **Post Install**                                                                               |
| adduser.sh                | Add a normal to the system.                                        |
| giveUsersRootAccess.sh    | Allows normal user to execute root commands                        |  
| uncommentCurrentMirror.sh | Uncomments the last mirror to get access to the current repository | 
| **Upgrade**                                                                                    |         
| writeBlockers.sh          | Block the kernel from being updated                                |
| update.sh                 | Updates the Slackware distro                                       |
| **Updgrade to Current**                                                                        |
| installSBOTools.sh        | Install SBO Tools to install new software                          |
| sboToolsConfigure.sh      | Configrue SBO Tools                                                |
| **Install Nvidia**        |                                                                    | 
| installNvidia.sh          | Install the Nvidida Drivers                                        |
| setModeSet.sh             | set nvidia-drm.modeset=1 for Hyprland to work                      |
| **Install Software**                                                                           |
| installSoftware.sh        | Install Software need for work and entertainment                   |
| oneTimeConfigure.sh       | Execute commands needed after installation                         |
| configure.sh              | Execute commands needed when a shell is started                    |
