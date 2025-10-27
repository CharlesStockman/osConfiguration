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
On Linux:

# Installation 

## Download and Extract 

```
Go to: https://www.ventoy.net/en/download.html
Download the appropriate version:
Linux or Macintosh: ventoy-x.x.xx-linux.tar.gz
```

## Identify Your USB Drive

```
diskutil list

# Look for your USB drive disk!
#The USB will typically be labeled with its size and name.
```

## Umount the USB (but don't eject)

```
# Replace X with your actual disk number (e.g., disk2).
diskutil unmountDisk /dev/diskX
```

## Install Ventoy

```
# Extract Ventoy
tar -xzvf ~/Downloads/ventoy-*-linux.tar.gz
cd ventoy-*

# Install to USB (replace diskX with your actual disk)
sudo sh Ventoy2Disk.sh -i /dev/diskX

# You'll be prompted:
# - Enter your Mac password
#- Confirm the installation (type `y`)
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


