# Installation

Overall the installation can be asily done by an intermediate or advnace linux developer easily ( I did the installation in 
less than an hour

## First Steps 
<b>Download the initial list of packages</b>

```
(cd /usr/src/t2-src ; t2 up  )
```

<b>Configure your system</b>
Ths tools will let you Optimize the system, select the kernel, Retry buidling broken pagckages, Create debug information and much more.

<b>Upgrade the system</b>

```
cd /sur/src/t2-src
t2 up
t2 upgrade
```

<b>Create an user for the system (provides shell, groups and creates home directory)</b>
```
sh createCstockmanUser.sh
```


|Command|Description|
|-------|-----------|
|( cd /usr/src/t2-src ; t2 up ) | Download/Updates the iniital source packages |
|( cd /usr/src/t2-src ; ./scripts/Emerge-Pkg neofetch | Installs a package     |

# Packages Installed 
<li>git</li>
&emsp;<li>asscidoc -- Convert asciidoc content to html5 </li>
