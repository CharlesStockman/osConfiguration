#
# Install on a macintosh
#

installFile="nixInstall.sh"
curl -L https://nixos.org/nix/install > $installFile
sh ./$installFile
rm $installFile
