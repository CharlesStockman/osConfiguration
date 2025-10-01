# Purpose 
My machine did not recognize a boot slackware iso ( though did recognize other bootable iso(s) )

I decided this was an oppurtunity to learn more about what commands are needed to install an actual linux system since in the future, I could be installing other distros such as ( Gentoo, T2SDE or GUIX as examples ).

# Prerequisites

## Create/Find a boot USB

## Create Disk Partitions
|Partition|File System|Description|
|---------|-----------|-----------|
|/dev/nvme0n1p1 | vfat ( EFI System) | A boot loader |
|/dev/nvme0n1p2 | swap | swap |
|/dev/nvme0n1p3 | ext4 | Where all the files and executables exist |\

## Use a wired connection

## 

## Installing 

Get a USB Stick that contains a boot distro

Complete Installation Process
Step 1: Preparation
Download Slackware:
bash# Get Slackware from a mirror
# You can use wget or rsync
# Example for Slackware 15.0:
wget -r -np -nH --cut-dirs=2 -R "index.html*" \
  https://mirrors.slackware.com/slackware/slackware64-15.0/slackware64/
Check your current disk layout:
bashlsblk
fdisk -l
Step 2: Partition Your Disk
For UEFI systems (since you're using ELILO):
bash# Use gdisk for GPT partition table (required for UEFI)
gdisk /dev/sdX

# Create partitions:
# 1. EFI System Partition: 512MB, type EF00
# 2. Swap: 2-4GB, type 8200
# 3. Root: 40GB+, type 8300
# 4. Home: remaining space, type 8300
Example gdisk commands:
o (create new GPT)
n (new partition)
  Partition number: 1
  First sector: (default)
  Last sector: +512M
  Hex code: EF00

n (new partition)
  Partition number: 2
  First sector: (default)
  Last sector: +4G
  Hex code: 8200

n (new partition)
  Partition number: 3
  First sector: (default)
  Last sector: +40G
  Hex code: 8300

n (new partition)
  Partition number: 4
  First sector: (default)
  Last sector: (default - use rest)
  Hex code: 8300

w (write changes)
Format partitions:
bash# EFI partition MUST be FAT32
mkfs.vfat -F 32 /dev/sdX1

# Swap
mkswap /dev/sdX2
swapon /dev/sdX2

# Root
mkfs.ext4 /dev/sdX3

# Home
mkfs.ext4 /dev/sdX4
Step 3: Mount Target Partitions
bash# Mount root
mount /dev/sdX3 /mnt

# Create necessary directories
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
