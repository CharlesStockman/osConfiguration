# Introduction
To describe the installation and configuration of the Nitrux Operating System

# Default Username and Password

<b>Username:</b> nitrux<br>
<b>Password:</b> nitrux

# Install Nitrux 
<b>Select the iso by Graphics Card</b><br>
&emsp;&emsp;Nvidia<br>
&emsp;&emsp;AMD

<li>Boot Nitrux from a USB Stick</li>
<li>Go to UEFI Firmware Settings and select the USB Drive with the nitrux iso.</li>
<li>Select "Boot Nitrux Live [Default]</li> and the desktop will appear.</li>
<li>Open a Terminal and enter the following command</li>

```
sudo -E start-calamares
# The sudo command will ask for the password ( enter the password shown above )
```

<li>Fill in all the data that Calamares requires.</li>
<li>Click Done Button and the machine will reboot</li>

## Lessons learned from the Installation process

### Partition Layout
<b>Recommendation:</b><br>
When installing (Using Calamares) use the partition setup that is recommended by the distro since one of the partitions must be readonly.

# Keyboard Bindings
In order to find the keyboarding bindings the developer should read the following file: <b>$HOME/.config/hypr/hyprland.conf</b> and search for the bindings section.
