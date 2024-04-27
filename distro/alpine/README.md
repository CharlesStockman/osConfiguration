## Introduction
The purpose is to describe the scripts that will be used to install the software and an Alpine Distribution.

## Prerequisite
[Using the instructions](https://wiki.alpinelinux.org/wiki/Installation) install Alpine. 

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



