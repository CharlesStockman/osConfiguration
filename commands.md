# Commands

## Grub Command 

|Command | Description |
|--------| ----------- |
| fwsetup | At Grub Window click "c" to get to the command line<br>fwsetup will send you to the bios program. 

## Unix Command Line Commands 

## Commands for accessing web 
|Command|Description|Example|
|-------|-----------|---------|
|curl   | Retrieve the contents of a text file and send it to STDOUT | `curl -s http://www.gtlib.gatech.edu/pub/gentoo/releases/amd64/autobuilds/latest-stage3-amd64-nomultilib-openrc.txt |
|curl   | download a file | curl $url --output /mnt/gentoo/stage3.xz |
|tar    | Extract an archive | tar xpvf stage3.xz --xattrs-include='*.*' --numeric-owner |

## Informational Commands

|Command|Description|Example
|-------|-----------|---------|
| free  | Shows the total, used, free, shared, buff/cache | free --giga |
| lsblk | A commands that dispaly the devide id, file type and version, size and amount used,  mountpoint and label | lsblk -f |
| swapon | Displays information about the file and partition | swapon --summary |
| nproc | Print the number of processing units available to the current process, which may be less than the number of online processors | nproc |
| id  | displays the uid, gid and groups | id root |
| fzf | fuzzy finder which enhances search ( file, git etc..) | Examples:<br>&emsp;find . type -f \| fzf<br>&emsp;history\|fzf<br>&emsp;git branch \| fzf<br><br><br>fzf -q cbt |

## Commands for Rocm 
| Command | Description |
|---------|-------------|
| rocminfo | Displays data about Hetrogenous System Archictecture: Attributes and Agents ( devices ) |

## Commands used in installation

### Creating Filesystems on partitions
|Command|Description| example |
|-------|-----------|---------|
|mkfs.vfat | Create a Fat32 File System on the specific partition | mkfs.vfat -F 32 /dev/nvme0n1p1 |
|mkfs.ext4 | Create an ext4 File System on the specific partition | mkfs.ext4 /dev/nvme0n1p2       |
|mkswap    | Create a  swap file system on a specific partition   | mkswap /dev/nvme0n1p3          |

### Adding a human readable string to each partition
|Command|Description| example |
|-------|-----------|---------|
|fatlabel | Adds a label to a partition with a microsoft filesystem (ex. vfat ) | fatlabel /dev/nvme0n1p1 "BOOT" | 
|e2label  | Adds a label to a partition with a linux filesystem (ex. ext2/ext3/ext4 ) | e2label /dev/nvme0n1p2 "Gentoo" | 
|swaplabel | Adds a label to a partition with a swap filesystem ( ex. swap filesystem ) | swaplabel /dev/nvme0n1p3 -L "Swap" |

### Swap Partition Commands
|Command|Description| example |
|-------|-----------|---------|
|swapon | Enable device and files for paging and swapping | swapon /dev/nvme0n1p3 |

## Distro Commands 

### Void

|Command|Descriptions|
|-------|------------|
| xbps-install --sync --update --yes | update the system|
| xbps-query --repository <package name> | Get information about a single package |
| xbps-query --list-pkgs | list all installed packages|
| xbps-query --yes <package> | Installs a packages |

## Shell one liners
|Code|Description|
|----|-----------|
|[-d /mnt/gentoo[] || mkdir --parents /mnt/gentoo | If /mnt/gentoo does exist then create the directory or directories |
| ip route get 1.2.3.4 \| awk '{print $7'} | command queries the Linux kernel's routing table to determine how traffic would be routed to the IP address 1.2.3.4<br>Produces output where the 7 element is the machines ip addr |


## Commands Described Later
<ul>
  <li>mount</li>
  <li>grep</li>
  <li>cut</li>
</ul>

## Init 


# Notes

## Kernel Space vs User Space

### Kernel Space:
Kernel space is a privileged memory area where the operating system's core (the kernel) runs. This is where the most critical and sensitive operations of the computer 
system take place. In kernel space:

<ol>
<li>The operating system has full hardware access</li>
<li>Low-level system operations are performed</li>
<li>Device drivers runL</li>
<li>Memory management occurs</li>
<li>Process scheduling is handled</li>
<li>System calls are processed</li>
</ol>

User Space:
User space is the memory area where user-level applications and processes run. It's a restricted environment with limited access to system resources. In user space:

<ol>
<li>Regular applications execute</li>
<li>Processes have limited privileges</li>
<li>Direct hardware access is prevented</li>
<li>Memory is protected from other processes</li>
<li>Applications communicate with the kernel through system calls</li>
</ol>

### Interaction Process:
When a user application needs to perform a system-level operation (like reading a file or network communication), it makes a system call. This transitions the process from 
user space to kernel space, where the kernel performs the requested operation, and then returns control back to the user space.This separation ensures system stability, 
security, and prevents applications from directly manipulating critical system resources.

## Linux Components

|Component|Description|
|---------|-----------|
|Direct Rendering Manager (DRM) | A Linux component that manages access to graphics hardware<br><br>The Kernel Mode Setting (KMS) is a part of the DRM system that sets the video mode in kernel space instead of userspace. Further, KMS configures and initializes the graphics hardware on boot and dynamically.<br><br>&emsp;&emsp;This flexibility also enables proper error handling and output.<br><br>&emsp;&emsp;To ensure we use KMS, we should disable kernel options such as vga, video, and other framebuffer drivers such as ubesafb.<br><br>&emsp;&emsp;KMS executes at or right after the initramfs boot stage.

## VP-API
An open source application programming interface that allows applications such as VLC media player or GStreamer to use hardware video acceleration capabilities, usually provided by the graphics processing unit (GPU). It is implemented by the free and open-source library libva, combined with a hardware-specific driver, usually provided together with the GPU driver.
