## Introduction
The purpose is to describe the scripts that will be used to install the software and an Alpine Distribution.

## Prerequisite
[Using the instructions](https://wiki.alpinelinux.org/wiki/Installation) install Alpine. 

The first suprise was step 1 -- "to select the keyboard" and two selections need to made.  For my setup the<br> 
  &emsp;**keymap:** is **us**<br>
  &emsp;**keymap:** is **layout** is **us**
<hr>

The second surpise was the way the networking was configured.  When installing a network, I always use eth0 and not wireless.  The questions they asked were the following:<br>
&emsp;**Which one do you want to initalize** is **eth0**<br>
&emsp;**Ip address for eth0?** is **dhcp**<br>
&emsp;**Which do you want to initialize** is **done**<br>
&emsp;**Do you want to do any manual network configuration** is **n**

It will take a few seconds, but the last line should discuss a lease being obtained.
<hr>
The third suprise was which NTP Clinent should be used.  I chose the default (chronu)<br>

&emsp;**Which NTP Client to run:** is **chrony**
<hr>

The fourth surprise was that it talked about which SSH Server to exeucte.<br>
&emsp;**Which ssh server:** is **openssh**<br>
<hr>

The fifth surprise was that it ask if you want to allow root login.  I choose the default of prohibiting the password<br>
&emsp;**Allow root ssh login:** is **prohibit-password**
<hr>

The Sixth surpise was that it asked how would you like to use it.  I choose "sys" which creates the boot, swap and "/" partition<br>
&emsp;**How would you like to use it:** is **sys**



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



