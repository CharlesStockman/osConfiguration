#!/bin/bash
 
#
# Build Hyorland
#

moveFiles () {
   cd $BUILD_TOP_LEVEL_DIR/
   cat hyprland-void/common/shlibs >> void-packages/common/shlibs
   cp -r hyprland-void/srcpkgs/* void-packages/srcpkgs
}

cd $BUILD_TOP_LEVEL_DIR

#
# Clone the hyprland templates for building with xbps-src and copy them to the void source tree
#
git clone https://github.com/Makrennel/hyprland-void.git

moveFiles

#
# Compile the packages
#
./void-packages/xbps-src pkg hyprland
./void-packages/xbps-src pkg xdg-desktop-portal-hyprland
./void-packages/xbps-src pkg hyprland-protocols



