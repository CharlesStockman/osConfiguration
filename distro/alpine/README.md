## Introduction
The purpose is to describe the scripts that will be used to install the software and an Alpine Distribution.

## Prerequisite
[Using the instructions](https://wiki.alpinelinux.org/wiki/Installation) install Alpine. 

The first suprise was selecting the keyboard and two selections need to made.  For my setup I used "us"for both answers.<br> 
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

The third surprise was which time zone are you in.  Please do not select EST or your date will be one hour behind.<br>
&emsp;**Which timezone are you in** is **America/New_York**
<hr>

The foruth suprise was which NTP Client should be used?  I chose the default (chrony)<br>
&emsp;**Which NTP Client to run:** is **chrony**
<hr>

The fifth surprise was that it talked about which SSH Server to exeucte.<br>
&emsp;**Which ssh server:** is **openssh**<br>
<hr>

The sixth surprise was that it ask if you want to allow root login.  I choose the default of prohibiting the password<br>
&emsp;**Allow root ssh login:** is **prohibit-password**
<hr>

The Seventh surpise was that it asked how would you like to use it.  I choose "sys" which creates the boot, swap and "/" partition<br>
&emsp;**How would you like to use it:** is **sys**



## Scripts
Should be executed in the following order.

| Script                    | Description                                                        |
| :------------------       | :---------:                                                        |
| intallSoftware.sh         | Install all the software that will be configured by the scripts    |
| **Post Install**                                                                               |
| adduser.sh                | Add a normal user to the system.  (currently does not work         |
| giveUsersRootAccess.sh    | Allows normal user to execute root commands                        |  
| uncommentCurrentMirror.sh | Uncomments the last mirror to get access to the current repository | 
| **Install Infrastructure  |                                                                    |
| **Install Hardware**      |                                                                    | 
| installNvidia.sh          | Install the Nvidida Drivers                                        |
| **Install Software**                                                                           |
| installSoftware.sh        | Install Software need for work and entertainment                   |
| oneTimeConfigure.sh       | Execute commands needed after installation                         |
| configure.sh              | Execute commands needed when a shell is started                    |



