#!/bin/bash

# Setup for local builds  
#
# exports BUILD_TOP_LEVEL_DIR
#

[ ! -d $HOME/.local/pkgs ] && mkdir -p $HOME/.local/pkgs
export BUILD_TOP_LEVEL_DIR=$HOME/.local/pkgs

sudo xbps-install --yes git vim kitty

#
# Get the void templates and prepare the enviornmnet
#

cd $BUILD_TOP_LEVEL_DIR

git clone https://github.com/void-linux/void-packages.git

./void-packages/xbps-src binary-bootstrap

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

#
# Install the packages
# 




