# Purpose 
The purpose of this document is to solve the problem of different commands for different software installers.  For each software installation solution the
commands will be mapped to a common set of commands ( ex. udpateWorkd, InstallPm, search)

<b>Interface for Software Installation Commands implemented for the commands of each software installer </b>

| Function ( Command ) | Inputs      | Description                                                    |
|----------------------|-------------|----------------------------------------------------------------|
| updateWorld          | None        | Syncrhonizes with distro's repositories and updates the system |
| installSoftware      | A package   | Installs one package and its depdendencies                     |
| search               | A package   | serach for specific package                                    |
| setup                | None        | softwarwe need before install software can be started.         |
