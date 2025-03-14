## Prerequistes

### The following Filesystem will be used
|Mount Point|Purpose|
|---------|-------|
|/boot/efi|The partition for UFFI|
|/|The linux partition|
|(swap)| The swap partition|

### Create the iso and boot the iso
Create an iso from the following link --> [iso](https://mirror.math.princeton.edu/pub/redcorelinux/amd64/iso-next/Redcore.Linux.Hardened.24xx.Unukalhai.KDE.RC1.amd64.iso">Redcore.Linux.Hardened.24xx.Unukalhai.KDE.RC1.amd64.iso)<br/>
Boot the ISO and Select "Start Redcore 24xx" which will take you to a desktop

## Installation

### Click the on the "Install System" to bring up the "Redcore Linux Hardeded 24xx Installer"
|Question|Answer|
|--------|------|
|Lanuage |American English|
|Location|America|
|Zone|New York|
|System Language|American English (United States)|
|Number and dates locale | American English (United States)|
|Keyboard|Keybord model Generic 105-key PC English US|
|Disk|Select Erase and default partions|
|Full Name|Charles Stockman|
|Login Name|cstockman|
|Name of Computer|Baldaur|
|Password|xxxx|

## Install Nvidia 
Use the following command to install nvidia: sisyphus install --ebuild nvidia-driver:5

Trusted users should be in the video group: gpasswd -a root video, gpasswd -a cstockman video

## Install an Editor -- Zed

Added the useflat nvidia 

### Install an Editor

Find a package: emerge --search app-editors/zed
Find a package: emerge --search app-editors/helix



