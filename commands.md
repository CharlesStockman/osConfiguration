# Commands

## Grub Command 

|Command | Description |
|--------| ----------- |
| fwsetup | At Grub Window click "c" to get to the command line<br>fwsetup will send you to the bios program. 

## Unix Command Line Commands 

|Command | Descriptions |
|------- | ------------ |

## Distro Commands 

### Void

|Command|Descriptions|
|-------|------------|
| xbps-install --sync --update --yes | update the system|
| xbps-query --repository <package name> | Get information about a single package |
| xbps-query --list-pkgs | list all installed pakcages|
| xbps-query --yes <package> | Installs a package

## Init 

### RC

|Command|Description|
|-------|-----------|
|sv status /var/service/* | Show all services and their status ( running or not )|
| ln -s /etc/sv/dbus /var/service | Starts a service at startup |
| sv start <service> | Start the service now.|