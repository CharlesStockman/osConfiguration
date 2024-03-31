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
| hardware       | install
