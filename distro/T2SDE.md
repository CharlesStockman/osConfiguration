# Installation

Overall the installation can be asily done by an intermediate or advnace linux developer easily ( I did the installation in 
less than an hour

## First Steps 

### Download metadata with new version and packages

```
(cd /usr/src/t2-src ; t2 up  )
```

### Install currevnt versions of the software

```
( cd /usr/src/t2-src ; t2 upgrade )
```


### Tangent: Upgrade produced errors

When I did my first system upgrade, I was met with a series of 54 errors.  Here is the process that I used to upgrde my system

<li>using the script command capture the output of the upgrade so the data can be analyzed </li>

```
script
t2 upgrade

# Control-D to save the file as typescript
# Output should be "file saved to typescript"
```

|Issue|Solution|Orignal Isssue Count|Fixed Issue Count|
|-----|--------|--------------------|-----------------|
|Could NOT find Python3 ( mssing Python3_EXECUTABLE Interpreter|54|40|t2 install python|


<b>Create an user for the system (provides shell, groups and creates home directory)</b>
```
sh createCstockmanUser.sh
```


|Command|Description|
|-------|-----------|
|( cd /usr/src/t2-src ; t2 up ) | Download/Updates the iniital source packages |
|( cd /usr/src/t2-src ; t2 install python ) | Installs a package     |

# Packages Installed

| package | optionals | Built |
|---------|-----------|-------|
| git     | list not recorded | Yes |
| python  | none              | Yes |
| bat     | none              | No  |
| eza     | none              | No  | 

<b>Configure your system</b>
Ths tools will let you Optimize the system, select the kernel, Retry buidling broken pagckages, Create debug information and much more.
