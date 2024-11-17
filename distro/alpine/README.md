## Introduction
The purpose is to describe the scripts that will be used to install the software and an Alpine Distribution.

[Using the instructions](https://wiki.alpinelinux.org/wiki/Installation) install Alpine. 

## Prerequisite

Create an USB with an Alpine Linux ISO

Boot with the ISO and login a root ( no password )

## Install and Initital Configuration of Alpine

Execute setup-alpine command to confgiure the environment

Select the keyboard and two selections need to made.  For my setup I used "us"for both answers.<br> 
  &emsp;**keymap:** is **us**<br>
  &emsp;**keymap:** is **layout** is **us**
<hr>

Provide the hostname<br>
&emsp;**Enter system hostname ( fully qualified form e.g. 'foo.example.org')[localhost]** is **loki** ( Choose your own hostname )
<hr>

Configure networking: When installing a network, I always use eth0 and not wireless.  The questions they asked were the following:<br>
&emsp;**Which one do you want to initalize** is **eth0**<br>
&emsp;**Ip address for eth0?** is **dhcp**<br>
&emsp;**Which do you want to initialize** is **done**<br>
&emsp;**Do you want to do any manual network configuration** is **n**

It will take a few seconds, but the last line should discuss a lease being obtained.
<hr>

Provide the Root Password<br>
&emsp;**New Password:** is **&quot;Provoide your own password&quot;**
<hr>

Configure the time zone are you in.  Please do not select EST or your date will be one hour behind.<br>
&emsp;**Which timezone are you in** is **America/New_York**
<hr>

Configure the Proxy<br>
&emsp;**Http/FTP proxy URL (e.g. 'http://proxy:8000' or 'none')[none]** is **none**

Configure NTP Client?  I chose the default (chrony)<br>
&emsp;**Which NTP Client to run:** is **chrony**
<hr>

Configure the APK Mirror to find the faster mirror
&emsp;**Enter mirror number or URL: [1]** is **f**
<hr>

Create an user<br>
&emsp; **Setup a user?** is **no**
<hr>

Configure SSH Server executable.<br>
&emsp;**Which ssh server:** is **openssh**<br>
&emsp;**Allow root ssh login:** is **prohibit-password**
&emsp'**Enter ssh key or URL for root (or 'none') [none]** is **none**
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
| **Install Infrastructure**|                                                                    |
| installDbus.sh            | A message bus sytem that provides a mechanism for IPC              |
| installElogind            | Integrates PAM to know the set of users that are logged in.        | 
|**Install Hardware**       |                                                                    | 
| installNvidia.sh          | Install the Nvidida Drivers                                        |
| **Install Software**                                                                           |
| installSoftware.sh        | Install Software need for work and entertainment                   |
| oneTimeConfigure.sh       | Execute commands needed after installation                         |
| configure.sh              | Execute commands needed when a shell is started                    |



