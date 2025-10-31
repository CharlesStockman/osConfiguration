# Intoduction
Ventoy is a great tool that lets you put multiple ISO files on a USB drive and boot from them directly.  This could help when the 
ISO is not bootable

Ventoy Boot Modes
Ventoy supports both UEFI and Legacy boot modes automatically. If one doesn't work: 
In the Ventoy boot menu, press F6 to switch between:

<ul>
<li>Normal mode</li>
<li>GRUB2 mode</li>
<li>MEMDISK mode</li>
</ul>

Advantages of Ventoy
<ul>
<li>Put multiple ISOs on one USB (great for system recovery/testing)</li>
<li>No need to reformat USB when adding new ISOs</li>
<li>Works with most bootable ISOs</li>
<li>Supports both UEFI and Legacy boot</li>
<li>Better compatibility than many other tools</li>
</ul>

<b>Important Note -- These instructions will not work on a macintosh.  Please use linux.</b>

# Installation 

## Download and Extract 

```
Go to: https://www.ventoy.net/en/download.html
Download the appropriate version:
Linux or Macintosh: ventoy-x.x.xx-linux.tar.gz
```

## Identify Your USB Drive

Have only one USB drive installed that can have the data on the drive erased

```
lsblk

# Look for your USB drive find the USB Drive and its mountpoint
```

## Umount the USB (but don't eject)

```
umount <mountpoint associated with the mountpoint>
```

## Install Ventoy

Become root using sudo <username>

```
# Extract Ventoy
tar -xzvf ~/Downloads/ventoy-*-linux.tar.gz
cd ventoy-*

# Install to USB (replace diskX with your actual disk)
sudo sh Ventoy2Disk.sh -i /dev/diskX

# You'll be prompted:
#- Confirm the installation (type `y`)
#- All the data on the disk /dev/sda will be lost!!!
```

## Add ISO Files
After installation:
The USB will automatically remount and appear on your desktop as "Ventoy".  You can add multiple ISOs if you want

Copy your Slackware ISO directly to the Ventoy drive:
```
cp ~/Downloads/slackware64-current-install-dvd.iso /Volumes/Ventoy/
```

## Eject Safely

```
diskutil eject /dev/diskX
```


