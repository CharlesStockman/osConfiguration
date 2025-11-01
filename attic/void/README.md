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

#### Dbus 

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
cd $HOME/osConfigurtion/distro/void/infrastructure/
sh ./Installdbus.sh
```

#### Session Management 

<b>Seatd</b>
seatd: Focused purely on seat/device management
seatd: Minimal dependencies, very lightweight
seatd: Best for minimal Wayland setups where you only need device access
seatd: Works with libseat-compatible compositors


<b>elogind</b>
elogind: Broader session management including power, seats, and user sessions
elogind: More dependencies but still lighter than full systemd
elogind: When you need full logind compatibility (polkit, power management, etc.)
elogind: Drop-in replacement for systemd-logind APIs



<b>Turnstile</b>
turnstile: Designed for runit/dinit service supervisors


Dependencies:


Use Cases:

turnstile: When you need user services on non-systemd systems

Compatibility:

turnstile: Complements elogind/seatd, doesn't replace them
