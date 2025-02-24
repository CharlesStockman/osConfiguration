#
# Install Nix 
# On nonsystemd systems it must be isntalled for each user on the system
#

# Initial Install
curl -L https://nixos.org/nix/install.sh
sh ./install.sh --no-daemon 

# Execute the initialization script
. /home/cstockman/.nix-profile/etc/profile.d/nix.sh


