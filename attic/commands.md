### Alpine
|Command|Descriptions|
|-----|-------------|
| apk add <software> | Installs Software |
| apk update  | Updates the list of available software based on the information found in /etc/apk/repositories ( repsoitories and alpine version ) |
| apk upgrade | upgrades the system from the lsit of software that was retrieved from apk update |

### Guix
|Command|Description|
|-------|-----------|
|guix install <softwre> | install the package and execute source ~/.guix-profile/etc/profile to execute the command from the command line|
|guix package -I        | check if a package has been install locally |
|guix package -A        | List available packages |
|guix describe          | Displays information about the channels configured ( Guix will always be configured by default ).  Provides info about the repository, current commit and branch |
|guix pull list-generations | Displays each generation of all channels the system is configrued for and for each generation includes the (repository, branch, commit ) |

### Void

|Command|Descriptions|
|-------|------------|
| xbps-install --sync --update --yes | update the system|
| xbps-query --repository <package name> | Get information about a single package |
| xbps-query --list-pkgs | list all installed packages|
| xbps-query --yes <package> | Installs a packages |

### RC

|Command|Description|
|-------|-----------|
|sv status /var/service/* | Show all services and their status ( running or not )|
| ln -s /etc/sv/dbus /var/service | Starts a service at startup |
| sv start <service> | Start the service now.|
