# Installation

Overall the installation can be asily done by an intermediate or advnace linux developer easily ( I did the installation in 
less than an hour

## First Steps 
<b>Perform the initial list of packages</b>

```
(cd /usr/src/t2-src ; t2 up  )
```

<b>Create an user for the system (provides shell, groups and creates home directory</b>
```
sh createCstockmanUser.sh
```


|Command|Description|
|-------|-----------|
|( cd /usr/src/t2-src ; t2 up ) | Download/Updates the iniital source packages |
|( cd /usr/src/t2-src ; ./scripts/Emerge-Pkg neofech | Installs a package      |

