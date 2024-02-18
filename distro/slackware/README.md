## Introduction
The purpose to describe the scripts that will used to install the software and configure the system 
for a slackware 15.0 distribution.

## Prerequisite
A new version of slackware 15.0 installed and the scripts must be excecuted as the user root.

## Scripts
Should be executed in the following order.

| Script                    | Description                                      |
| :------------------       | :---------:                                      |
| adduser.sh                | Add a normal to the systeem.                     |
| giveUsersRootAccess.sh    | Allows normal user to execute root commands      |  
| uncommentCurrentMirror.sh | Does not work yet                                |
| writeBlockers.sh          | Block the kernel from being updated              |
| update.sh                 | Updates the Slackware distro                     |
| installSBOTools.sh        | Install SBO Tools to install new software        |
| installNvidia.sh          | Does not work with Hyprland yet                  |
| installSoftware.sh        | Install Software need for work and entertainment |
| oneTimeConfigure.sh       | Execute commands needed after installation       |
| configure.sh              | Execute commands needed when a shell is started  |
