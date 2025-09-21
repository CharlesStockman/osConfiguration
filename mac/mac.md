
# Creating a Bootable Image

A Bootable image is useful if the latest version of the Mac OS does not install and you need to rollback.

## Download the macOS Installer:

<ol>
<li>Get the installer - Download your desired macOS version from the Mac App Store or Apple's support website (the installer will be saved to your Applications folder as "Install macOS [Version Name].app").</li>
<li>Verify the download - Ensure the full installer downloaded completely (it should be several GB in size).</li>
</ol>

## Prepare the USB Drive:

<ol>
<li>Insert USB drive - Connect a USB flash drive or external disk with at least 16GB of available storage.</li>
<li>Erase the drive - Select your USB drive, click "Erase," choose "Mac OS Extended (Journaled)" format</li>
</ol>

## Create the Bootable Installer:

<ol>
<li> Open Terminal</li>
<li>Run the create install media command - sudo Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume</li>
<li>Enter your password - Provide your admin password when prompted and confirm by typing "Y" when asked.</li>
<li>Wait for completion - The process will take 20-30 minutes to complete, showing progress updates.</li>  
</ol>

## Finalize and Test:

<ol>
<li>  
Eject safely - Once completed, eject the USB drive properly through Finder or Disk Utility.
</li>
<li>
Test the bootable drive - Restart your Mac while holding the Option key to access the boot menu and verify your installer appears as a bootable option.
</li>
</ol>

The USB drive will be renamed to "Install macOS [Version]" once the process completes successfully.



# Macintosh Configuration

## Settings

* If the setting is not mentioned then it should not be configured.

| Setting | Sub Setting | Configuration | 
| ------- | ------------| ------------- | 
| Network | | Firewall should be inactive |
| Network | | Thunderbolt should be inactive |
| General | | Local hostname should be change to Thor.local to make it unique |
| Lock Screen    | | Start Screen when inactive -- Set to 1 hour and 30 minutes |
| Lock Screen    | | Turn display off when inactive For -- two hours |
| Lock Screen    | | Require password after screen save begins o0r display is turned off -- Never |

## Finder 

| Setting | Configuration |
|---------|---------------|
| View --> As List | Display entries as list |
| View --> Show Table Bar | Allow for mulltiple tabs |
| View --> Show Path Bar | Allow the absolute path to be shown |
| View --> Show Status Bar | Dislpaly thge number of items in the folder / the amount of memory available |
| Finder --> Finder Settings --> General --> Show these items on the desktop | Unselect Harddrives, Connecgted servers External disks and Select CDs, DVDs and IPods |
| Finder --> Finder Settings --> General --> New Find Windows Show | Select cstockman |
| Finder --> Finder Settings --> General --> Open folders in tabs instead of new window | Should be selected |
| Finder --> Finder Settings --> Side Bar --> Show these items in the sidebar --> Favorites | Unselect All then Select Applliations, Desktop, Dockments, Downloads, cstockman |
| Finder --> Finder Settings --> Side Bar --> Show these items in the sidebar --> ICloud | Select all |
| Finder --> Finder Settings --> Side Bar --> Show these items in the sidebar --> Locations | Select all |
| Finder --> Finder Settings --> Side Bar --> Show these items in the sidebar --> Tags | Select all |
| Finder --> Finder Settings --> Advanced | Unselect All and When performing a search -- Search this mac |

## Command Line 
setFile -a -V /Volumes/"MyBook 1" to make the backup drive visible returns an error code of -5000

## Installation of Software before brew

| Software | Installation Insturctions | 
|--------- | ------------------------- |
| Command Line Tools | xcode-select --install then click Install and Agree.  Tools needed for brew package manager |

## Installation and Configurtion of packages installed by brew
### Installation
&emsp; To install brew package manager execute installBrew.sh

| Script | Descripton |
|--------|------------|
| initalInstall.sh | Install Programs needed to install configure the rest of the applications such as git, jq, ansible |
| commericalInstall.sh | Applications such as Slack, Discord are commerical and may not be availaable on all machines |


