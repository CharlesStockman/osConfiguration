#
# Install External Packages
#

cd $BUILD_TOP_LEVEL_DIR/void-packages/
sudo xbps-install -R hostdir/binpkgs
sudo xbps-install -R hostdir/binpkgs hyprland-protocols
sudo xbps-install -R hostdir/binpkgs xdg-desktop-portal-hyprland
