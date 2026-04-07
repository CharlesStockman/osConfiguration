#Flatpak

Flatpak is a Linux application packaging and distribution tools that allows applicatons to run on any linux distro

## Commands

|Command|Description|
|-------|-----------|
|flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo | Configure flatpak command to know where to retrieve flatpaks
|flatpak --assumeyes install flathub com.jetbrains.PyCharm-Professional | Put the application into a sandbox( isolated environment)