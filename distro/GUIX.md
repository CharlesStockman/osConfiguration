# GUIX as a Package Manager

## Introduction

Currently my use of GUIX will be the primary location where I get most of my packages.  For now, I will be using GUIX package manger on two foreign distributions: Alpine Linux and Nitrux.

### Architecture 
<li>All packages built and installed  will be stored in the /gnu/store</li>
<li>Creates different users on the system to do parallel builds.</li>
<li>Whenever a package is installed by a user the dependencies are download so the application can be isolated from the system.</li>

### Init Systems Supported by GUI
<li>systemd</li>
<li>OpenRC</li>
<li>sysv-init</li>
<li>upstart</li>

The init system will autotmatically execute guix-daemon ( A daemon used for building and installing packages from GUIX)

### Prerequisites 
<li>bash</li>
<li>xz</li>

## Install Guix
```
  cd /tmp
  wget https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh
  chmod +x guix-install.sh
  sudo ./guix-install.sh
```

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
