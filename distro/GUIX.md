# GUIX as a Package Manager

## Introduction

Install GUIX modularity.  For exmaple, could install direclty to hardware or WSL2

### Architecture 
<li>All packages built and installed  will be stored in the /gnu/store</li>
<li>Creates different users on the system to do parallel builds.</li>
<li>Whenever a package is installed by a user the dependencies are download so the application can be isolated from the system.</li>

The init system will autotmatically execute guix-daemon ( A daemon used for building and installing packages from GUIX)

## Install Guix

<li>download https://ftpmirror.gnu.org/gnu/guix/guix-system-install-1.4.0.x86_64-linux.iso">x86_64 and burn to iso</li>
<li>Assumption: The partitions have created earlier --  format the partitions using: sh ../scripts/fileTypeForPartition.sh</li>
<li></li>

<
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
