## Installation
The [FreeBSD Handbook](https://docs.freebsd.org/en/books/handbook/) is an excellent guide.  So of the decisions that I have decided are 
explained below.

I am trying to keep the system as simple as possible since this is my first intall of FreeBsd.

### For the Dialog Box "Distribution Select" 
|Item | Selected (Yes/No) | Notes |
|-----|------------|-------|
|base-dbg | No | |
|kernel-dbg | No ||
|lib32-dbg| No ||
|lib32| No |  If needed can run pkg install lib32 |
|ports| No | I am new to BSD so I Decide to use Packages since they are compiled and can focus on setting the software up.  In the future I will migrate to ports |
|src| No ||
|Test Suite | No ||

### ZFS Configuration</b>
For the Dialog <b>"Partitioning"</b> I will be Using <b>"Auto (ZFS) Guided Root-on-ZFS"</b> since I am new to ZFS

### Network Configuration</b>
For the Network Configuration Dialog: <b>"Please select a network interface to configure"</b> Choose <b>"Gigabit Internet since it is easier"</b><br>
For the Network Configuration Dialog: <b>"Would you like to configure IPv4 for this interface"</b> Choose <b>"Yes"</b><br>
For the Network Configuration Dialog: <b>"Would you lke to use DHCP to configure this interface"</b> Choose <b>"Yes"</b><br>
For the Network Configuration Dialog: <b>"Would you like to configure IPv6 for this interface"</b> Choose <b>"No"</b><br>
For the Network Configuration Dialog: <b>Resolver Configuration</b> just select OK the information should be correct

### System Configuration
#### Choose the Services
The two defaults are sshd and dumpdev, but I have choosen ntpd, ntpd_sync_on_start to keep the time updated.
|Service| Reason |
|-------|--------|
| ntpd | The NTP daemon that keeps time synchronized continuously |
| ntpd_sync_on_start | Forces immediate time sync when ntpd starts (at boot) |
| moused | PS/2 mouse pointer on console since I will be using Terminal applications |

<b>Final Configuration</b><br>
Install the Freebsd Handbook



## Post Installation

### Upgrade the system
```
freebsd-update fetch
freebsd-update install
```

### pkg 
A binary package manager, but may try ports in the future

### Doas

pkg intall doas

/usr/local/etc/doas.conf 
  permit nopass :wheel

### Commands 

|Command|Description|
|-------|-----------|
|service -e |Show services that are enabled|
|service -l |List all scripts in /usr/local//etc/rc.d and /usr/local/etc/rc|
