# Slackware 

## Reason I chose slackware as one of my distros

There are some quotes in the slackware community 

>	If you want to learn Debian use Debian <br>
>	If you want to learn Red Hat use Red Hat <br>
>	If you want to learn linux use Slackware

<b>Another Quote</b>

> People use Slackware because they prefer understanding, control, and predictability ahead of convenience

<b>Another Quote</b>
> Slackware uses plain old tgz files, doesn't use systemd, and I can (usually) easily upgrade individual pieces of software without upsetting some other unrelated stuff.

<b>Another Quote</b>
>It's the 'old-school' muscle car of the Linux lineup. If someone wants to learn the nuts-n-bolts of Linux, then Slackware might still be the best choice of distro, as what one gets is a fairly vanilla iteration of Linux with fewer layers of added abstraction, and that makes things less cumbersome and confusing, as one doesn't have to 'dig through a tangled mess to get to the engine' (as is the case with fancy-shmancy new cars).

>there's no automatic dependency resolution (this thing's gotta stick shift), but that's part of the fun, and it's conducive to knowing what's being put on the system.

## Installation of Slackware
<ul>
	<li>In the past, I had issues creating a slackware iso with BalenaEtcher<br>instead use sudo dd if=slackware64-current-install-dvd.iso of=/dev/sdX bs=4M status=progress oflag=sync</li>
	<li>Do not install lilo or elilo since they are considered legacy software.  Grub2 is the modern replacement</li>   
</ul>

If help is needed for installing I would recommend the following video (first 21 minutes should be enough): [Slackware 15 is Released! A Distro You Really Should Try Because You're Worth It!](https://www.youtube.com/watch?v=0yoP9xnh4jI&t=1537s)

## Post Installation 

<ul>
<li>These scripts are specific to my environment so changes to use in your environment might be needed</li>
<li>This is the first run through with these scripts and might need updates in the future.
</ul>

### Prerequisite

<b>The scripts will be found on an USB</b>
<ul>
    <li>mkdir /mnt/transfer</li>
    <li>mount /dev/sdb1 /mnt/transfer
</ul>

### Chroot to the Slackware Installation
Right now, you're still running off the USB stick's installer environment — not the Slackware system you just installed to disk. The next step is to chroot into that newly installed system so you can work inside it directly.

[Chroot and Mount USB with Files ](scripts/chrootAndMountUsb.sh)
### Install Grub
<b>Grub will perform the following actions</b>
<ul>
<li>Present the boot menu and allows the user to select an operating system</li>
<li>Hand off boot arguments that affect how the OS Starts</li>
</ul>

[Install Grub](scripts/installGrub.sh)

### Add a User
In order to add a user to the operating system.  I have create two script

| script | Description |
|--------|-------------|
| addUser.sh | Will create a user with sane defaults especially home directory, groups the user belong to and the shell |
| allowUserSudo.sh | Allow a normal user to peform root responsbilities |

[addUser.sh](scripts/addUser.sh)

[allowUserSudo.sh](scripts/allowUserSudo.sh)

### Reboot
At this point we may need to reboot since the network is not up.
After rebooting the network will be active.

<b>The scripts will be found on an USB</b>
<ul>
    <li>mkdir /mnt/transfer</li>
    <li>mount /dev/sdb1 /mnt/transfer
</ul>

## Recurring Tasks

### Upgrade Slackware

To allow Slackware to upgrade itself we need to select a repository and download the keys used to upgrade the software.

[Uncomment Mirror and Download GPG Kyes](scripts/uncommentMirrorAndGetGPG.sh)

<b>Commands to install/update software from Slackware itself</b>
<ol>
<li>slackpkg update -- Update the package list </li>
<li>slackpkg install-new -- Install any new packages added in the release</li>
<li>slackpkg upgrade-all -- Upgrade all installed packages</li>
</ol>

Do not atteempt the "slackpkg clean since it might remove the builds from slackbuilds.org too.

## SboTools

The purpose of these tools is to interact with slackbuilds.org to install and update software that slackware does not have.

[slackbuilds.org](https://slackbuilds.org) will be repository where most of our builds are retrieved from.

<b>Prerequisites</b>
<ol>
	<li>Install the sbotools from https://github.com/pghvlaans/sbotools.git for Slackware 15.0</li>
	<li>Create the repository containing the packages that can installed on your system</li>
</ol>

[Install sbo tools and Repository of installable software](scripts/installSbo.sh)

| Command  | Description                                                                               |
|----------|------------------------------------------------------------------------------------       |
| sbocheck | download the the build instrucitons for all the packages (repsository), but if present then it does an incremental update/sync from slackbuilds.org. |
| sboconfig | Display name / value pairs that sbtools uses.                                            |
| sboconfig -V 15.0 | Sets SLACKWARE_VERSION to 15                                                     |
| sbofind <package name > | Searches the repository ( on the local machine for the package.            |
| sboinstall <package name > | Installs the specific package.                                          |

| File Location and Name | Descriptpion |
|------------------------|--------------|
| /usr/sbo/repo | The location where all the build instructions is kept ( repository ) |

