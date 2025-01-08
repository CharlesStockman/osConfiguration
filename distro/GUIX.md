# GUIX as a Package Manager

## Introduciton

Currently my use of GUIX will be the primary location where I get most of my packages.  For now, I will be using GUIX package manger on two foreign distributions: Alpine Linux and Nitrux.

### Architecture 
<li>All packages built and installed  will be stored in the /gnu/store</li>
<li>Creates different users on the system to do parallel builds.</li>

### Init Systems Supported by GUI
<li>systemd</li>
<li>OpenRC</li>
<li>sysv-init</li>
<li>upstart</li>

The init system will autotmatically execute guix-daemon ( A daemon used for building and installing packages from GUIX)

## Install gui
```
  cd /tmp
  wget https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh
  chmod +x guix-install.sh
  sudo ./guix-install.sh
```
