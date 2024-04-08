#
# Another package manager that can install packages that can't be found in the void 
# repository due to the reasonable rules for adding packages to the repository
#

xbps-install --sync --yes nix

# Add the nix-daemon to the list of services started at startup and start the service now 
ln -s /etc/sv/nix-daemon/ /var/service
sv start nix-daemon

# Add the chnanel that will contain the software
nix-channel --add https://nixos/chnanels/nixpkgs-unstable



