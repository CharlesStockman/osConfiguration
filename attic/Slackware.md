# Purpose 
My machine did not recognize a boot slackware iso though did recognize other bootable iso(s)

I decided this was an oppurtunity to learn more about what commands are needed to install an actual linux system since in the future, I could be installing other distros such as ( Gentoo, T2SDE or GUIX as examples ).

# Prerequisites

## Create/Find a bootable USB
The USB will be used to boot the computer that slackware will be installed on and will provides the commands needed to build the distro.

A good choice is the following: [Bootable Gentoo USB](https://distfiles.gentoo.org/releases/amd64/autobuilds/20250928T160345Z/install-amd64-minimal-20250928T160345Z.iso)

## Create Disk Partitions
|Partition|File System|Description|
|---------|-----------|-----------|
|/dev/nvme0n1p1 | vfat ( EFI System) | A boot loader
|/dev/nvme0n1p2 | swap | swap |
|/dev/nvme0n1p3 | ext4 | Where all the files and executables exist 

# Setting up the machine for installation
1. Boot the machine with the bootable USB create in prerequisites
2. Plug in the USB that contains the scripts to install Slackware on the machine and perform the following shell command
```
mkdir -p /mnt/transfer
mount /dev/sdb1 /mnt/transfer
```

# Installation
All scripts will be found in /mnt2/transfer/slackware

Create a directory /mnt2 that will mount the directories where slackware will be intallled

## Before Chroot

### Format Paritions
```
cd /mnt/transfer/slackware
sh ./01_formatPartitions.sh 
```
### Mount Partitions
Mounts the /mnt ( where slackware will be installed and /mnt/boot/efi )
```
sh ./02_mountPartitions.sh
```

## After Chroot
## Reboot



## Get all the pakcages from the Slackware Current Iso
```
  # Copy the slackware current to the USB Stick
  cp slackware64-current-install-dvd.iso <USB Stick>

  # Using the boot USB start the computer that slackware will be installed

  # Mount the USB that the slackware current iso is found which will called the <Data USB>
  mkdir /mnt/data
  mount <Data USB> /mnt/data

  # Mount the iso found on the <Data USB>
  mkdir /mnt/data2
  mount slackware64-current-install-dvd.iso /mnt/data2

  # Create a command which creates a space separated list of directories from the slackware iso containing *.txz files to be installed
  # For the find -not -name '.' will filter the current directory from the list
  # For paste -s merges lines from a single file into one line instead of merging multiple files side-by-side
  directoryList=`find . -maxdepth 1 -type d -not -name '.' | paste -sd ' ' -`

  # Copy the files and the directory structure from the slackware iso to the USB to make installing easier.
  for directory in $directoryList
  do
     mkdir -p /mnt/data/packages/$directory
     cp /mnt/data2/slackware64/$directory/*.txz /mnt/data/packages/$directory
  done

  umount /mnt/data2
```

## Installing

### Boot the linux machines

Boot the machine using a Linux Bootable USB.  For example the one that you create in section "Create/Find a bootable USB"
Format partitions:

### Clone the OS Configuration Repository
The OS Configuration Repositiory will contain scripts to install distributions, aliases, configuration files and more.  

```
cd
git clone https://github.com/CharlesStockman/osConfiguration.git
```

### Create the Filesystems

Create the filesystems for the partitions ( UEFI Boot, Swap, Os )

A good practice is to put a label on each drive.  A label useful for the follwoing reasons
<ol>
  <li>Human Readable</li>
  <li>Inserting an Removing USB Sticks can shuffle device names ( ex. /dev/sda1, /dev/sdb1)</li>
  <li>Labels remain constnat when the device name changes</li>
</ol>

```
cd
cd scripts/installation
sh ./createFilesystems.sh
```

### Turn on Swapping

```
cd
cd scripts/installation
sh ./activateSwapPartition.sh
```

### Create necessary directories
mkdir -p /mnt/{boot/efi,home,proc,sys,dev,dev/pts}

# Mount EFI partition
mount /dev/sdX1 /mnt/boot/efi

# Mount home
mount /dev/sdX4 /mnt/home
Step 4: Install ALL Package Groups (Except KDE)
bash# Navigate to your Slackware directory
cd /path/to/slackware64/

# Install each series
# If you don't have installpkg, extract it first:
tar xvf a/pkgtools-*.t?z -C /mnt

# Now install all packages (EXCLUDING kde series)
for series in a ap d e f k l n t tcl x xap xfce y; do
    echo "Installing series: $series"
    /mnt/sbin/installpkg --root /mnt $series/*.t?z
done

# Note: We're skipping 'kde' series
Package series breakdown:

a - Base system (essential)
ap - Applications (text editors, shells, utilities)
d - Development (compilers, headers, dev tools)
e - Emacs
f - FAQs and HOWTOs
k - Kernel source
l - Libraries (essential)
n - Networking (essential)
t - TeX typesetting system
tcl - Tcl/Tk scripting
x - X Window System base
xap - X applications
xfce - Xfce desktop environment
y - Games
kde - (SKIPPED as requested)

This will take a while. Monitor for any errors.
Step 5: Configure the Base System
Mount essential filesystems and chroot:
bashmount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys
mount --bind /dev /mnt/dev
mount --bind /dev/pts /mnt/dev/pts

# If you have efivarfs (UEFI):
mount -t efivarfs efivarfs /mnt/sys/firmware/efi/efivars

chroot /mnt /bin/bash
source /etc/profile
Inside the chroot:
bash# Set root password
passwd

# Set hostname
echo "slackware-box" > /etc/HOSTNAME
echo "127.0.0.1    localhost" > /etc/hosts
echo "127.0.1.1    slackware-box" >> /etc/hosts

# Configure timezone
tzselect
# Then create symlink based on your selection, e.g.:
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Configure hardware clock
# If using UTC (recommended):
cat > /etc/hardwareclock << EOF
UTC
EOF
Edit /etc/fstab:
bashcat > /etc/fstab << 'EOF'
/dev/sdX1    /boot/efi    vfat    defaults         0   2
/dev/sdX2    swap         swap    defaults         0   0
/dev/sdX3    /            ext4    defaults         1   1
/dev/sdX4    /home        ext4    defaults         1   2

proc         /proc        proc    defaults         0   0
sysfs        /sys         sysfs   defaults         0   0
tmpfs        /tmp         tmpfs   defaults         0   0
devpts       /dev/pts     devpts  gid=5,mode=620   0   0
EOF
Replace sdX with your actual device!
Configure network:
bash# For DHCP (simple):
cat > /etc/rc.d/rc.inet1.conf << 'EOF'
USE_DHCP[0]="yes"
DHCP_HOSTNAME[0]=""
EOF

# Make network script executable
chmod +x /etc/rc.d/rc.inet1

# Or for static IP, edit /etc/rc.d/rc.inet1.conf with your settings
Step 6: Install and Configure ELILO
Check if ELILO package is installed:
bashls /var/log/packages/ | grep elilo
If not installed:
bash# You may need to install it separately or from extras
# Slackware might not include elilo by default
# You might need to download it or use another UEFI bootloader
Actually, for UEFI systems, I recommend using GRUB2 instead (more common and better supported):
bash# Install GRUB for UEFI
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Slackware --recheck

# Generate GRUB config
grub-mkconfig -o /boot/grub/grub.cfg
However, if you specifically want ELILO:
bash# Install elilo if available
installpkg /path/to/elilo-*.t?z

# Create elilo.conf
cat > /boot/efi/EFI/Slackware/elilo.conf << 'EOF'
prompt
timeout=50
default=Slackware

image=vmlinuz
    label=Slackware
    root=/dev/sdX3
    read-only
    append="vga=normal"

image=vmlinuz
    label=Slackware-huge
    root=/dev/sdX3
    initrd=initrd.gz
    read-only
    append="vga=normal"
EOF

# Copy kernel to EFI partition
mkdir -p /boot/efi/EFI/Slackware
cp /boot/vmlinuz-huge-* /boot/efi/EFI/Slackware/vmlinuz

# Run elilo to install
elilo
Note: ELILO is quite old and rarely used. Most modern UEFI Slackware installations use either:

GRUB2 (most common, best compatibility)
Direct UEFI boot (copy kernel to EFI partition)
rEFInd (boot manager)

Would you like me to provide instructions for one of these alternatives instead?
Step 7: Additional Configuration
bash# Enable services you want
chmod +x /etc/rc.d/rc.sshd   # SSH server
chmod +x /etc/rc.d/rc.httpd  # Apache (if needed)

# Configure default runlevel
# Edit /etc/inittab
# Change default runlevel: id:3:initdefault: (console) or id:4:initdefault: (GUI)
# For XFCE, use runlevel 4

# If using runlevel 4, set default window manager:
xwmconfig  # Select xfce
Step 8: Create Initial RAM Disk (if needed)
bash# For generic kernel, you'll need initrd
# For huge kernel, you might not need it

# If needed:
mkinitrd -c -k 5.15.19 -m ext4 -f ext4 -r /dev/sdX3
# Adjust kernel version to match your installed kernel
Step 9: Exit and Reboot
bash# Exit chroot
exit

# Unmount everything in reverse order
umount /mnt/sys/firmware/efi/efivars
umount /mnt/dev/pts
umount /mnt/dev
umount /mnt/sys
umount /mnt/proc
umount /mnt/boot/efi
umount /mnt/home
umount /mnt

# Disable swap
swapoff /dev/sdX2

# Reboot
reboot
Troubleshooting
If system doesn't boot:

Boot from rescue media
Mount your partitions
Chroot back in
Check /boot/efi/EFI/Slackware/ for bootloader files
Re-run bootloader installation

Check UEFI boot entries:
bashefibootmgr -v
