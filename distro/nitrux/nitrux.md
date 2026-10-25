# Introduction
To describe the installation and configuration of the Nitrux Operating System
https://github.com/CharlesStockman/osConfiguration/blob/master/distro/nitrux.md
# Default Username and Password

<b>Username:</b> nitrux<br>
<b>Password:</b> nitrux

# Install Nitrux 
<b>Select the iso by Graphics Card</b><br>

<li>Download and burn the iso to an USB Stick.</li>
<li>Go to UEFI Firmware Settings and select the USB Drive with the nitrux iso.</li>
<li>Select "Boot Nitrux Live [Default]</li> and the desktop will appear.</li>
<li>Open a Terminal and enter the following command</li>

```
sudo -E start-calamares
```
<li>Fill in all the data that Calamares requires.</li>
<p>
  For this Section: Partitions<br>

  <b>Question: </b><br>
  Drop Down Box with the selections: No Swap, Swap No hibernate, Swap with hibernate or Swap to file<br>

  <b>Answer: </b><br>
  Select: "Swap to file" since it is the modern default of new Linux Distrubtions.<br>
</p>
<li>Click Done Button and the machine will reboot</li>

## Lessons learned from the Installation process

### Partition Layout
<b>Recommendation:</b><br>
When installing (Using Calamares) use the partition setup that is recommended by the distro since one of the partitions must be readonly.

# Installing Software
Nitrux does not have a package manger of its own instead you have to install your own package manager

<b>Recommended Package Managers</b>
<ol>
  <li>Homebrew</li>
  <li>Flatpak</li>
  <li>Snaps</li>
  <li>Guix</li>
</ol>

## Installing homebrew
Follow the instructions for a linux installation of <a href="../mac/brew.md" target="_blank">Homebrew</a>

# Appendix

## Keyboard Bindings
In order to find the keyboarding bindings the developer should read the following file: <b>$HOME/.config/hypr/hyprland.lua</b> and search for the bindings section.

## Mounting an USB
Auto-mount is the (simplest) which uses udev + udisks2, so plugging in a USB drive should auto-mount it under /run/media/$USER/<label> or /media/$USER/<label>. 

<b>Will show the Name of the device ( ex. /dev/sda1 )</b>
```
lsblk
```
<b>Mount the drive</b>
```
udisksctl mount -b /dev/sdX1
```

## Edit Files
micro is nitrux's default command line editor

<b>The basic commands are</b>
|Command|Description|
|-------|-----------|
|ctrl S |Saves a file|
|ctrl Q |Quits the editor|
