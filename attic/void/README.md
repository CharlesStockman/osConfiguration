# Installation

This is a distro that is not aimed at the beginner, but the more experienced user so my suggestion is to use the void handbook to install the distro -- [Void Handbook](https://docs.voidlinux.org/)

## Post Install

<b>Assumptions</b>
<ul>
  <li>The Root User is being used for configuration</li>
  <li>Access to the wired conneciton is wired</li>
  <li>The sysetm has just been installed ( I don't think have an affect, but I added just in case )</li>
  <ul>
    <li>For a new install root will only have two aliased so ". ./aliases.sh; alias" is executed it is easier to see the new aliases</li>
  </ul>
</ul>

### Download osConfiguraiton which contains the installation scripts

```
xbps-install --sync --update --yes git

mkdir $HOME/git
cd clone
git clone https://github.com/CharlesStockman/osConfiguration.git
```

### Source the aliases 
```
cd $HOME/git/distro/void/general
. ./aliases.sh
```

### Setup the Infrastrcture
```
sudo xbps-install --yes void-repo-nonfree
sudo xbps-install --yes void-repo-multilib
sudo xbps-install --yes void-repo-multilib-nonfree
```

### Setup the Infrastrcture

#### Inter-process Communcation 

D-Bus (Desktop Bus) is an inter-process communication (IPC) system that allows multiple programs running on the same computer to communicate with each other.

Key Uses
<ul>
<li>System-level operations:</li>
   <ul>
      <li>Hardware management (detecting USB devices, network connections)</li>
      <li>System services (power management, login sessions)</li>
      <li>Device notifications (battery status, disk mounting)</li>
   </ul>
<li>Desktop applications:</li>
   <ul>
     <li>Media player controls (Spotify, VLC responding to keyboard media keys)</li>
     <li>Notifications (desktop notification popups)</li>
     <li>Screen sharing and clipboard management</li>
     <li>Application integration (apps talking to each other)</li>
   </ul>
</ul>

```
cd $HOME/osConfiguration/distro/void/infrastructure/
sh ./Installdbus.sh
```

#### Session Management 

Session management is the system that tracks and controls user login sessions and their associated resources.

<b>Seatd</b>
<li>seatd: Focused purely on seat/device management</li>
<li>seatd: Minimal dependencies, very lightweight</li>
<li>seatd: Best for minimal Wayland setups where you only need device access</li>
<li>seatd: Works with libseat-compatible compositors</li><br>

<b>elogind</b>
<li>elogind: Broader session management including power, seats, and user sessions</li>
<li>elogind: More dependencies but still lighter than full systemd</li>
<li>elogind: When you need full logind compatibility (polkit, power management, etc.)</li>
<li>elogind: Drop-in replacement for systemd-logind APIs</li><br>


```
cd $HOME/osConfigurtion/distro/void/infrastructure/
sh ./04_seat.sh
```
#### User Management

<b>Not Implemnted yet</b>

Handles user-level service management (starting user daemons and background services)

<b>Turnstile</b>
<li>turnstile: Designed for runit/dinit service supervisors</li>
<li>tunrnstile: When you need user services on non-systemd systems</li>
<li>turnstile: Complements elogind/seatd, doesn't replace them</li>
