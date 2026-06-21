#
# Purpose: To install packages that will allow use to install packages from slackbuild
#

git clone https://github.com/pghvlaans/sbotools.git
cd sbotools/slackbuild/sbotools

. ./sbotools.info
wget $DOWNLOAD

sh sbotools.SLACKBUILD
installpkg /tmp/sbotools*.tgz

# Sets the location to get the builds for current 
# Create the repository of all the packages that can be built based on the Slackware Version Current
sboconfig -r https://github.com/Ponce/slackbuilds.git
sbocheck
