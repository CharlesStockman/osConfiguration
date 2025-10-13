#
# Setup for local builds  
#
# exports BUILD_TOP_LEVEL_DIR
#

[ ! -d $HOME/.local/pkgs ] && mkdir -p $HOME/.local/pkgs
export BUILD_TOP_LEVEL_DIR=$HOME/.local/pkgs

sudo xbps-install --yes git vim kitty



