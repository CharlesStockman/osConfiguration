# Installation and Configuring GUIX

## Prerequisites 

### Download iso

Download the iso to install the GUIX from the url and burn it:<br> 
&emsp;&emsp;https://github.com/SystemCrafters/guix-installer/releases

### Partition the Drive

The Drive will be partition into 3 sections

| Section Number | Type      |
|----------------|-----------|
| 1              | /boot/efi |
| 2              | /         |
| 3              | swap      |

### Internet Access

For the best internet connection used an ethernet cable

## Creating your first system.scm

Boot the iso and the installer will be started.

| Question                      | Answer                                                                                                                                               | Description                                                                          |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Language                      | English                                                                                                                                              |                                                                                      |
| Locale Location               | United States                                                                                                                                        |                                                                                      |
| Welcome Screen                | Graphical Install using a terminal based interface                                                                                                   | Could get a dialog box stating Device not support by free software.  Just click ok   |
| Time Zone                     | Select America then New York                                                                                                                         |                                                                                      |
| Keyboard Layout               | English (US)                                                                                                                                         |                                                                                      |
| Variant                       | English (US)                                                                                                                                         |                                                                                      |
| Host Name                     | Baldaur                                                                                                                                              |                                                                                      |
| Internet Access               | Wired                                                                                                                                                |                                                                                      |
| Substitute Server Discovery   | Enable                                                                                                                                               | Allow Guix to download prebuild binaries instead of compiling source code            |
| System Administrator Password | <Enter password>                                                                                                                                     |                                                                                      |
| User Creation                 | Click Yes<br><br/>Enter Answers<br>Name: cstockman<br>Real Name: Charles Stockman<br>Password<br> and Confirm Password after clicking OK<br>Click OK |                                                                                      |
| Desktop Environment           | Click OK                                                                                                                                             | The Desktop will selected in another *.scm file later on.                            |
| Network Service               | Select Mozilla NSS Certificates for HTTP Access                                                                                                      | Certificates verify the https host connected to.                                     |
| Network Management            | Select Network Manager                                                                                                                               | Conman is made for the Raspberry PI and DHCP client is for servers                   |
| Console Services              | Select Network Time Service and GPM mouse daemon                                                                                                     | GPM Mouse Daemon selected here so the later scm to setup the console can be portable |
| Print and Document Services   | None                                                                                                                                                 | I do not have a printer                                                              |
| Partition Method              | Manual                                                                                                                                               | Hard disk already partitioned we need to make an addition                            |
| Manual Partitioning           | Select 2nd Drive ( Not the /efi/boot or swap )                                                                                                       |                                                                                      |
| Partition Edit                | Format the Partition Yes<br>Mount Point "/"<br>                                                                                                      |                                                                                      |
| Format Disk                   | Click continue to format drive  <br/>                                                                                                                |                                                                                      |
| Configuration File            | Click on Exit                                                                                                                                        | Purpose is to get into the shell                                                     |

## Prepare for installation

| Reason                     | Commands executed                                                      |
|----------------------------|------------------------------------------------------------------------|
| Go to new terminal         | Use Ctrl-Alt-3 to switch to another virtual screen.</li>               |
| Start the herd init system | herd start cow-store /mnt                                              |
| config.scm                 | cp /etc/channels.scm /mnt/etc/channels.scm<br/>chmod +w channels.scm</ |

### Modify the script created by the installer

Changes to made to use the NonGNU
<ul>
  <li>for the use-modules list add (nongnu packages linux) and (guix-channels)</li>
  <li>After (operating-system add (kernel linux) and on the next line (firmware (list linux-firmware))</li>
</ul>

Install the new distribution


```sh
# time-machine -- tell GUIX to use the specified channels and have time machine call sytem init installed on /mnt
# "--" means passing along system init /mnt/etc/config.scm /mnt
# /mnt is where the new installation will be installed.
guix time-machine -C /mnt/etc/channels.scm -- system init /mnt/etc/config.scm /mnt
```

