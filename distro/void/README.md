# Have Decided to stop working on void, but keeping the script for now.  They should be in good working order.

# Purpose Install Void
The purpose of this document is to describe how to install the software and configure VOID after the intial installation has been completed

# Scripts for Installing void
All the scripts should be run in root

| Directory | Script | Explanation |
|-----------|--------|-------------|
| postInstall | 01_installRepositories | Installs the repositories that will be need for installing software |
| postInstall | 02_createUser.sh | Creates a script that requires a username as input and provides defaults for group, home directory and shell.|
| postInstall | 03_giveUserRootAccess.sh | Allows all users to haave root access on the machine |
| infrastructure | 01_installdbus.hs | D-Bus is a message bus system, a simple way for applications to talk to one another |
| infrastructure | 02_elogind.sh | installs elogind<br> For sway or wayland in general it can be used to also do some required privileged things, in this case setting up the "drm" (Direct Rendering Manager) which is required for wayland. If sway doesn't use elogind/logind to handle the privileged parts|
| Infrastructure | 03_nix.sh | Install and Confgure nix package manger<br>currrently not working see issue: https://github.com/CharlesStockman/osConfiguration/issues/17 |
| hardware | installPipewire.sh | install and configure pipewire the following components of pipewire.<br>Pipewire -- improves handling of audio and video under linux<br>Pipewire Manager -- Watching for new streams and connect them to the appropiate ouptut device or application.<br>Pulse Audio -- A sound server that provides a number of features on top of low level audio including Networking support, per-application volume contorl, Dynamic latency, Better cross-platform support and plugin modules
