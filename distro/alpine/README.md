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
<hr>

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

Configure the disk<br> 
Choose "sys" which creates the boot, swap and "/" partition<br>
Choose thye disk from list of "Available disks" above<br>
&emsp;**which disk(s) would you like ot use ( or '?' for help or 'none')[none]** is **nvme0n1**<br>
&emsp;**How would you like to use it:** is **sys**<br>
&emsp;**Erase the avove disk(s) and continue (y/n) [n]** is **y**<br>
<hr>

Exeucte the command reboot

## Create User

Execute setup-user command to confgiure a new user with root privileges ( wheel group )
&emsp;**Setup a user? (enter a lower-case loginame, or 'no')** is **cstockman**<br/>
&emsp;**Full name for user** is **Charles Stockman**<br/>
&emsp;**New Password:** is **Enter your password**<br/>
&emsp;**Enter ssh key or URL** is **none**
<hr>

### Provide Root Access for the user
doas -- Related to sudo, but is more lightweight and secure<br/>
&emsp;**adduser <username> wheel<br/>** 
&emsp;**apk add doas<br/>** 
&emsp;**echo "permit persist :wheel" > /etc/doas.d/doas.conf**
<hr>

## Enable Community Repostiory

Decided to not work from the edge repository since I want to focus on learning commands and want to use this as a daily driver.

Add Community Repository<br>
&emsp;**setup-apkrepos -cf**

cat /etc/apk/repostiories and the line that end in community should not be commented

## Adding Low Level Graphic Drviers for Wayland
### Install KMS
<ol>
  <li>Add the radeon or amdgpu and fbcon modules to /etc/modules: echo amdgpu >> /etc/modules ; echo fbcon >> /etc/modules</li>
  <li>Enable the kms feature by adding *kms* to the features variable, e.g., Contents of /etc/mkinitfs/mkinitfs.conf</li>
  <li>Execute mkinitfs</li>
  <li>Reboot to test the configuration</li>
</ol>

### Installing Low Level Applications
