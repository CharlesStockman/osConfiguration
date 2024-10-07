# Commands

## Grub Command 

|Command | Description |
|--------| ----------- |
| fwsetup | At Grub Window click "c" to get to the command line<br>fwsetup will send you to the bios program. 

## Unix Command Line Commands 
## Commands providing Information about the systems
|Command|Description|Example
|-------|-----------|---------|
| lsblk | A commands that dispaly the devide id, size and mountpoint and label | lsblk -f |

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

## Init 

### RC

|Command|Description|
|-------|-----------|
|sv status /var/service/* | Show all services and their status ( running or not )|
| ln -s /etc/sv/dbus /var/service | Starts a service at startup |
| sv start <service> | Start the service now.|

