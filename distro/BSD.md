## Installation

The installation was a little confusing, but I was able to get through it.

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
