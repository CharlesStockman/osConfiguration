#
# Purpose install software using sbotools
#

# Create the package and install the software into the Slackware Ecoysystem.
installSoftware() {
   sboinstall -r $1
   installpkg /tmp/*.tgz
}

export PATH=/sbin:/usr/sbin:/usr/lib64/go1.22.1/go/bin/:$PATH

# Flatpak
#installSoftware "xdg-desktop-portal-gtk"
#installSoftware "bubblewrap"
#installSoftware "ostree"
#installSoftware "gcab"
#installSoftware "appstream-glib"
#installSoftware "flatpak"

# Applications
#installSoftware "brave-browser"

# Go
#installSoftware "google-go-lang"

# Kitty
#installSoftware "librsync"
#installSoftware "simde"
#installSoftware "kitty"

# Hyperland
installSoftware "scdoc"
installSoftware "seatd"
installSoftware "hyprland-bin"

# Java 
#installSoftware "zulu-openjdk21"
#installSoftware "apache-maven"

# Docker
#installSoftware "docker-proxy"
#installSoftware "tini"
#installSoftware "runc"
#installSoftware "containerd"
#installSoftware "docker"
#installSoftware "docker-cli"

rm /tmp/*.tgz


