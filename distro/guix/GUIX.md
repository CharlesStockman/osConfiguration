# GUIX as a Package Manager

## Introduction

Install GUIX modularity.  For example, could install directly to hardware or WSL2

### Architecture 
<li>All packages built and installed  will be stored in the /gnu/store</li>
<li>Creates different users on the system to do parallel builds.</li>
<li>Whenever a user installs a package the dependencies are download so the application can be isolated from the system.</li>

#### Definitions
%base-packages
%base-services

#### Base Services
<b>Core System Services:</b>
| Service | Description |
|---------|-------------|
|shepherd-root-service | The init system/service manager|
|user-processes-service | Manages user login processes |
|host-name-service | Sets the system hostname |
|mingetty-service | Provides login prompts on virtual terminals (tty1, tty2, etc.) |
|nscd-service | Name service cache daemon for DNS lookups |
|syslog-service |  System logging daemon |
|urandom-seed-service |  Entropy/random number generation |
|guix-service - The Guix daemon for package management

<b>File System Services:</b>
| Service | Description |
|---------|-------------|
| root-file-system-service |  Mounts the root filesystem |
| file-system-service | Handles other filesystem mounts |
| user-unmount-service | Unmounts user filesystems on shutdown |

<b>Hardware Support:</b>
| Service | Description |
|---------|-------------|
| udev-service |  Device management |
| console-font-service |  Console font configuration |



The init system will automatically execute guix-daemon ( A daemon used for building and installing packages from GUIX)

## Install Guix

<b>Assumptions</b>
<ol>
  <li>Create partition 1 for UFFI</li>
  <li>Create partition 2 for swap</li>
  <li>Create partition 3 for root which contains configration, work and executable files </li>
</ol>

<li>download https://ftpmirror.gnu.org/gnu/guix/guix-system-install-1.4.0.x86_64-linux.iso">x86_64 and burn to iso</li>
<li>Format the partitions using: sh ../scripts/fileTypeForPartition.sh</li>
<li>Mount and turn the swap on by executing sh ../scripts/setup_filesystems.sh</li>
<li>instal_system.sh</li>

<br><br>
### Questions Asked While Installing
<li>Ask for password to perform root commands (answer enter password)</li>
<li>Press Return which acts a pause to read the information</li>
<li>(Twice for 2 differetnt keys)Ask Permission to instrall public key required for verification of Guix binary signature (answer should be yes)</li>
<li>Would you like the Guix deaemon to automatically discover substitute servers on the local network (answer no)</li>
<li>Permit downloading pre-build package binares fromt he broject's build farms? (answer yes)</li>
<li>Customize user's bash shell prompt for Guix (anser no)</li>
<br>

## Configure Guix for a user
```
guix pull
guix upgrade
```

## Install Docker
```
  guix install dockerd
  guix install docker
  guix install docker-cli

  user: doas usermod -ag docker <username>
```

## Install AMD Roc
|Package|Description|
|-------|-----------|
|rocm-opencl-runtime| Install Opencl |
|rocm-comgr| ???                     |
|rocm-cmake| ???                     |
|rocm-bandwidth-test| ???            |
|rocm-device-libs| ???               |
|rocr-runtime| ???                   |
|rocminfo    | Displays data about Hetrogenous System Archictecture: Attributes and Agents ( devices ) |

However, this still not install hipcc 
