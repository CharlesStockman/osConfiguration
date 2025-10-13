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
Select the "Install the Freebsd Handbook"

<b>Install</b>

## Post Installation

### Install Software needed for Post Installation

The only software needed is git used to clone the osConfiguration directory which will contain the configuration scripts.

<ol>
  <li>pkg install git</li>
  <li>git clone https://CharlesStockman/osConfiguration.git</li>
</ol>

### doas
The doas command provides a way to perform commands as another user. It aims to be a a simplified and lightweight replacement for sudo

```
cd
cd osConfiguration/distro/bsd/scripts/postInstall
sh ./doas.sh
```

### Create an User
<b>Difference between adduser and pw</b>
<ul>
<li>adduser: Interactive, beginner-friendly, asks questions</li>
<li>pw: Command-line, scriptable, requires you to specify everything</li>
</ul>

### Login Class
A login class in FreeBSD is a way to define resource limits and environment settings for groups of users. It's configured in /etc/login.conf.

<b>What login classes control</b>
|Item|Description|
|---|------------|
|Resource limits|CPU time, memory usage, file sizes, open files|
|Process priorities|Nice values, scheduling priorities|
|Environment variables|PATH, timezone, language settings|
|Session settings|Idle timeouts, password requirements|
|Accounting|Usage tracking and quota|

<b>Default login classes</b>
|default|Standard users (used if nothing specified)|
|-------|------------------------------------------|
|root|Root account with fewer restrictions|
|daemon|System daemons and services|
|staff|Administrative staff (more resources than default)|

### Upgrade the system
```
freebsd-update fetch
freebsd-update install
```

### pkg 
A binary package manager

#### Commands
|Command|Explanation|
|-------|-----------|
|pkg search <string> | Search for the string as part of the name or the description |
|pkg install &lt;package name&gt; | Installs the package |
|pkg info -D -a | Show all messages from all installed packages|

### Doas

pkg intall doas

/usr/local/etc/doas.conf 
  permit nopass :wheel

### Commands 

|Command|Description|
|-------|-----------|
|service -e |Show services that are enabled|
|service -l |List all scripts in /usr/local//etc/rc.d and /usr/local/etc/rc|
