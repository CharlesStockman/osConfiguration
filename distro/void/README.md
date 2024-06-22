# Purpose Install Void
The purpose of this document is to describe how to install the software and configure VOID after the intial installation has been completed.  

The most important design decision is that I am using Hyprland.  I am installing both elogind and seatd and from my reading will be trying to remove seatd. 



# Scripts for Installing void
All the scripts should be run in root

| Directory | Script | Explanation |
|-----------|--------|-------------|
| postInstall | 01_installRepositories | Installs the repositories that will be need for installing software |
| postInstall | 02_createUser.sh | Creates a script that requires a username as input and provides defaults for group, home directory and shell.|
| postInstall | 03_giveUserRootAccess.sh | Allows all users to haave root access on the machine |
| infrastructure | 01_installdbus.hs | D-Bus is a message bus system, a simple way for applications to talk to one another |
| infrastructure | 02_elogind.sh | installs elogind<br> elogind is a login manager and provides support for setting up necessary permissions for the desktop environment or window manager handling poweroff, reboot, suspend and hibernate via loginctl command 
| hardware | 01_installFirmware_and_graphic.sh | Installs<br> &emsp;- AMD Graphic Drivers &emsp;<br>&emsp;- Open GL<br>&emsp;- Vulkan<br>&emsp; -Vidio Acceleration| Installs AMD Driver<br>&emsp
| hardware | installPipewire.sh | install and configure pipewire the following components of pipewire.<br>Pipewire -- improves handling of audio and video under linux<br>Pipewire Manager -- Watching for new streams and connect them to the appropiate ouptut device or application.<br>Pulse Audio -- A sound server that provides a number of features on top of low level audio including Networking support, per-application volume contorl, Dynamic latency, Better cross-platform support and plugin modules

# Adding External Programs
There some programs that are not in the void repositories since the void team is trying to maintain the integratity and make sure that the repositories are workng for the majority of the software.  However, 
there is another to install software such as Wayland on the void.

|Directory|Script|Explanantion|
|---------|------|------------|
|externalBuilds|buildExternal.sh|Creates the needed environment and compiles the software based on a template|
|externalBuilds|InstallExtPackages.sh|Install the new created packages|
