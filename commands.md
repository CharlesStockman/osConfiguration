# Commands

## Grub Command 

|Command | Description |
|--------| ----------- |
| fwsetup | At Grub Window click "c" to get to the command line<br>fwsetup will send you to the bios program. 

## Unix Command Line Commands 
## Commands providing Information about the systems
|Command|Description|
|-------|-----------|
| lsblk | A commands that dispaly the devide id, size and mountpoint |

## Distro Commands 

### Creating Filesystems

|Command|Description| example |
|-------|-----------|---------|
|mkfs.vfat | Create a Fat32 File System on the specific partition | mkfs.vfat -F 32 /dev/nvme0n1p |
|mkfs.ext4 | Create an ext4 File System on the specific partition | mkfs.ext4 /dev/nvme0n1p       |
|mkswap    | Create a  swap file system on a specific partition   | mkswap /dev/nvme0n1p          |

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

