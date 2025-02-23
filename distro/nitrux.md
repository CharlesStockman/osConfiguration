# Purpose 
To describe the installation of the Nitrux Operation System

# Installation
In order to install Nitrux Os, the following instructions should be used [Nitrux Install](https://www.youtube.com/watch?v=pGgzSSSfCGo&t=337s) starting at 4 minutes and 14 seconds into the video
When Partitioning the Disk let Nitrux decide the partitions since one partition since some of the partitions will be read-only.  When I tried, I use the standard boot/swap/linux partition and my linux partition turned out to be readonly.

# Configuration
## FlatPak
Nitrux has flatpak installed by default and will be used for the following purposes:
<ol>
<li>Install Software where the source code is not needed.</li>
<li>Install Software that you want to evaluate</li>
</ol>

Also flatpak is already configured to retrieve flatpaks from flathub.

|Purpose|Command|
|-------|-------|
|Install Software | flatpak --assumeyes install flathub org.libreoffice.LibreOffice |
|List flatpaks on local drive | flatpak list |
|Search for flatpaks in flathub | flatpak search <search string> |

###
Notes on flatpak
|Flatpak|Issue|Solution|
|-------|-----|--------|
|Zed|Had trouble running in wayland | execute env WAYLAND_DISPLAY=$WAYLAND_DISPLAY|
|Helix| Had trouble running in wayland | execute env WAYLAND_DISPLAY=$WAYLAND_DISPLAY flatpak run com.helix_editor.Helix|

## Dock ( Plasma Panels )
### Adding an Applications to the Doc
Goto the Application Launcher ( Should be first item on the of the dock ) and click to get a list of applictions.  Select the application and drag onto the dock
### Delete an Application on the Doc
Rigt Click on the applicaiton on the doc and select "Unpin From Task Manager"
