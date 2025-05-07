## Prerequisites

### Get the Boot ISO

[Download Page](https://t2sde.org/download/25.4?download/) is the page to select the iso that will contain the files to be installed on the system.  
[Chose iso: x86-64/Glibc/Clang 20.1/nocona](https://dl.t2sde.org/binary/2025/t2-25.4-x86-64-base-wayland-glibc-clang-nocona.iso">base-wayland) and burn to an USB.

### Setup the disk

|Partition|Mount Point| Use |
|---------|-----------|-----|
| 1       | /boot/efi | UEFI |
| 2       | swap      | Swap |
| 3       | /         | Programs/Data |

### Grub Screen
Put the USB into computer and start it ( Assumption only one USB stick is attached to the comptuer which will be device (/dev/sda1)
<li>The Grub window will appear select Grub Window will appear and select <b>T2 Installation</b> </li>


## Stage 1
The purpose is to allow the selection of the installation source

<b>What do you want to do [0-4] (default=0)?</b>
&emsp;<li>Select the default(0) which is the files to be installed that are on the USB Stick (local device)</li>

<b>Enter nubmer or device file name (default=/dev/sda1):</b>
&emsp;<li>Select the default(default=/dev/sda1)</li>

<b>Select a second stage image file:</b>
&emsp;<li>Select the default ( stage2ext.tar.zst (2))</li>

<b>For the question about terminal</b>
&emsp;<li>Select the default</li>

## Stage 2
Install the systems

<li>On the command enter stone to start the GUI Installer</li><br>

<b>Select one of the following keyboard mappings</b>
&emsp;<li>Select US</li>

<b>Storge Setup: Partitions and Mount Ports</b>
<ol>
<li>Select UEFI partition and select "mount existing ext4 filesystem" to bring up the "Mount Device" Dialog Box</li>
<li>In the "Mount Device" Diaglog Device verify "/boot/efi" is present and click ok</li>
<li>Select partition will contain the programs/data and select "mount existing ext4 filesystem" to bring up the "Mount Device" Dialog Box</li>
<li>In the "Mount Device" Diaglog Device verify "/" is present and click ok</li>
</ol>

<b>On the screen from pervious instructions</b>
<ol>
  <li>Select "Install the sytem ... to bring up the "Package Management" Dialog Box"</li>
  <li>Select "Start gasgui Package Manager (recommended) to bring up "Select and de-select packages." "</li>
  <li>Select "All Packages and Select the finsh button"</li>
</ol>



