#
# Purpose install software using sbotools
#

# Create the package and install the software into the Slackware Ecoysystem.
installSoftware() {
   sboinstall -r $1
   installpkg /tmp/*.tgz
}

# Flatpak
installSoftware "xdg-desktop-portal-gtk"
installSoftware "bubblewrap"
installSoftware "ostree"i
installSoftware "gcab"
installSoftware "appstream-glib"
installSoftware "flatpak"

# Applications
installSoftware "brave-browser"

# Kitty
installSoftware "librsync"
installSoftware "kitty"

# Hyperland
installSoftware "scdoc"
installSoftware "seatd"
installSoftware "hyprland-bin"

# Java 
installSoftware "zulu-openjdk21"
installSoftware "apache-maven"

# Go
installSoftware "google-go-lang"

# Docker
installSoftware "docker-proxy"
installSoftware "tini"
installSoftware "runc"
installSoftware "containerd"
installSoftware "docker"
installSoftware "docker-cli"

