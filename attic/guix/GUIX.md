# GUIX as a Package Manager

# Warning the installation is not finished. I ran into an error and it would be best to fix using a virtual machine.

## Introduction

Install GUIX modularity.  For example, could install directly to hardware or WSL2

### Architecture 
<li>Channels -- Repositories of different software ex: nonguix for linux firmware</li>
<li>All packages built and installed  will be stored in the /gnu/store</li>
<li>Whenever a user installs a package the dependencies are download so the application can be isolated from the system.</li>

#### Definitions
%base-packages<br>
%base-services

#### Base Services
<b>Core System Services:</b><br>

| Service | Description |
|---------|-------------|
|shepherd-root-service | The init system/service manager|
|user-processes-service | Manages user login processes |
|host-name-service | Sets the system hostname |
|mingetty-service | Provides login prompts on virtual terminals (tty1, tty2, etc.) |
|nscd-service | Name service cache daemon for DNS lookups |
|syslog-service |  System logging daemon |
|urandom-seed-service |  Entropy/random number generation |
|guix-service - The Guix daemon for package management

<b>File System Services:</b>

| Service | Description |
|---------|-------------|
| root-file-system-service |  Mounts the root filesystem |
| file-system-service | Handles other filesystem mounts |
| user-unmount-service | Unmounts user filesystems on shutdown |

<b>Hardware Support:</b>

| Service | Description |
|---------|-------------|
| udev-service |  Device management |
| console-font-service |  Console font configuration |

The init system will automatically execute guix-daemon ( A daemon used for building and installing packages from GUIX)

## Install Guix

### Assumptions

<b>Partitioning of Disk</b>
| Section Number | Type      |
|----------------|-----------|
| 1              | /boot/efi |
| 2              | swap      |
| 3              | /         |

<b>Internet Access</b>
For the best internet connection used an ethernet cable

<b>Create the Boot Disk to Install Guix (Use the mnost current version)</b> 
<li>download <a href="https://ftpmirror.gnu.org/gnu/guix/guix-system-install-1.4.0.x86_64-linux.iso">GUIX Installer</a> and burn to an USB Stick</li>
<li>Insert the boot usb so a terminal appears</li><br>

### Installing Guix 

Boot the iso and the installer will be started.

##### Anwer the Initial Questions to Generate the Configuration Script

| Question                      | Answer                                                                                                                                               | Description                                                                          |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Locale Language               | English                                                                                                                                              |                                                                                      |
| Territory                     | United States                                                                                                                                        |                                                                                      |
| Welcome Screen                | Graphical Install using a terminal based interface                                                                                                   | Could get a dialog box stating Device not support by free software.  Just click ok   |
| Time Zone                     | Select America then New York                                                                                                                         |                                                                                      |
| Keyboard Layout               | English (US)                                                                                                                                         |                                                                                      |
| Variant                       | English (US)                                                                                                                                         |                                                                                      |
| Host Name                     | strixHalo                                                                                                                                            |                                                                                      |
| Internet Access               | Wired                                                                                                                                                |                                                                                      |
| Substitute Server Discovery   | Enable                                                                                                                                               | Allow Guix to download prebuild binaries instead of compiling source code            |
| System Administrator Password | <Enter password>                                                                                                                                     |                                                                                      |
| User Creation                 | Click Yes<br>Click Add<br><b>Enter Answers</b><br>Name: cstockman<br>Real Name: Charles Stockman<br>Password<br>Click OK                             | Confirm Password after clicking OK                                                   |      
| Kernel                        | Linux Libre                                                                                                                                          |                                                                                      |  
| Desktop Environment           | Select KDE                                                                                                                                           | The Desktop will selected in another *.scm file later on.                            |
| Network Service               | Select OpenSSH secure shell daemon (sshd)                                                                                                            |                                                                                      |    
| Print and Document Services   | None                                                                                                                                                 | I do not have a printer                                                              |
| Partition Method              | Guided - Using the entire disk                                                                                                                       |                                                                                      |
| Manual Partitioning           | Select 2nd Drive ( Usually an nvme )                                                                                                                 |                                                                                      |
| Partition Scheme              | Select -- Everything is one partition                                                                                                                |                                                                                      |
| Guided Partitioning           | Select the partitition which should not be boot or swap                                                                                              |                                                                                      |
| Partition Edit                | Name: None<br>File System Type: xfs<br>ESP Flag: Off<br>Encryption: No<br>Format the Partition? Yes<br>Mount Point: /                                |                                                                                      |
| Format Disk                   | Click continue to format drive  <br/>                                                                                                                |                                                                                      |
| Configuration File            | Click on Exit                                                                                                                                        | Purpose is to get into the shell                                                     |

##### Modifications to the Configuration Script

The next is to manually chamnge the kernel that is being used.  The current is the Linux Libre which does not contain the 
nonfree drivers for WIFI and Graphic Card.  The new kernel will be the full linux kernel

<b>Setup the Environment</b>

[Channel Configuration](config/channels.scm)<br>
[Machine Configuration](config/config.scm)

| Reason                     | Commands executed                                                      |
|----------------------------|------------------------------------------------------------------------|
| Go to new terminal         | Use Ctrl-Alt-3 to switch to another virtual screen.</li>               |
| Mount / Drive              | mount /dev/nvme0np3 /mnt                                               |
| Copy channels.scm          | cp channels.scm /mnt/etc                                               |
| Start the herd init system | herd start cow-store /mnt (Uses config.scm found in /mnt/etc           |

#### Modify the script created by the installer

edit the file and make the following changes

Changes to made to use the NonGNU
<ul>
  <li>for the use-modules list add (nongnu packages linux)</li>
  <li>After (operating-system add (kernel linux) and on the next line (firmware (list linux-firmware))</li>
</ul>

#### Install the New Distribution


```sh
# time-machine -- tell GUIX to use the specified channels and have time machine call sytem init installed on /mnt
# "--" means passing along system init /mnt/etc/config.scm /mnt
# /mnt is where the new installation will be installed.
guix time-machine -C /mnt/etc/channels.scm -- system init /mnt/etc/config.scm /mnt
```

Update the Configuration
```sh
guix pull
```

## Configure Guix for a user
```
guix pull
guix upgrade
```

## Install Docker
```
  guix install dockerd
  guix install docker
  guix install docker-cli

  user: doas usermod -ag docker <username>
```

## Install AMD Roc
|Package|Description|
|-------|-----------|
|rocm-opencl-runtime| Install Opencl |
|rocm-comgr| ???                     |
|rocm-cmake| ???                     |
|rocm-bandwidth-test| ???            |
|rocm-device-libs| ???               |
|rocr-runtime| ???                   |
|rocminfo    | Displays data about Hetrogenous System Archictecture: Attributes and Agents ( devices ) |

However, this still not install hipcc 
