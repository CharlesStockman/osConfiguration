#!/bin/bash

source ../reuse.sh 

#
# Update the whole system
#
# -S	 	Synchronize remote repository index files	
# -u 	  	Perform a full system upgrade	
# -y		Assume yes to all questions.
#
function updateWorld {
	xbps-install -Suy 
}

#
# Install a specific package
#
# -y		Assume yet to all questions.
#
function installPackage {
 	xbps-install -y $1	
}

#
# Search for a specific package in the repositories
#
# -R -- 
#
function search {
	xbps-query -R $1
}

#
# Adds a repository
#
function addRepository {
        xbps-install -Sy $1
}

################################################################################
# Setup a location for github repositories needed for intalling software      ##
# As of 08/04/2021 the brave browser is not part of the void repository       ##
# However, people have created the files needed to install the browser        ##
# using the void tools.                                                       ##
################################################################################

#
# Initial Brave Browser build and install
#
function compileInstallSoftware() {

	# Directory where the bootstrap and the packages that are not in the repository and need to be rebuilt. 
	directory="otherGitForInstall"
	absolutePath=~/$directory

	# Allows root to compile the code
	export XBPS_ALLOW_CHROOT_BREAKOUT=5
	
	mkdir $absolutePath 

	# Create the environment to compile and install the software
	# ( cd $absolutePath ; git clone https://github.com/void-linux/void-packages ; cd void-packages ; ./xbps-src binary-bootstrap )

	# Get the brave browser that will be intalled and install it
	( cd $absolutePath ; git clone https://gitlab.com/ElPresidentePoole/brave-bin ; cp -r brave-bin void-packages/srcpkgs/ ) 
	( cd $absolutePath ; cd void-packages ; pwd ; ./xbps-src pkg brave-bin ; xbps-install --yes --repository hostdir/binpkgs brave-bin )
	
}

#
# Update when the Brave Browser is installed
#
function updateCompileInstallSoftware() {

	
	# Directory where the bootstrap and the packages that are not in the repository and need to be rebuilt. 
	directory="otherGitForInstall"
	absolutePath=~/$directory
	
	# Allows root to compile the code
	export XBPS_ALLOW_CHROOT_BREAKOUT=5
	
	# Update the bootstrap packages
	( cd $absolutePath ; cd void-packages; ./xbps-src bootstrap-update )

	# Update and rebuild the brave/bin repository
        ( cd $absolutePath ; cd brave-bin ; git pull ; cd .. ; cp -r brave-bin void-packages/srcpkgs/ ) 
	( cd $absolutePath ; cd void-packages ; ./xbps-src pkg brave-bin ; xbps-install --yes --force --repository hostdir/binpkgs brave-bin )
}

#
# Install Sdkman -- To make it easier for Void to get up to date versions of java and maybe someother
#
# Lesson Learned : When using sdkman and su then each su must "source sdkman-init.sh"
# 
function installSdkMan {
	export SDKMAN_DIR="$config_homeDirectory/.sdkman" && su -c 'curl -s https://get.sdkman.io | bash' $config_username
	su -c "export SDKMAN_DIR=$config_homeDirectory/.sdkman ; source $config_homeDirectory/.sdkman/bin/sdkman-init.sh ; sdk install java 16.0.2-open" $config_username  
}

#
# Software installed to install software needed for the distribution 
#
function setup() {
   installPackage jq
   installPackage void-repo-nonfree

   # Needed to get the packages metadata downloaded to this machine
   updateWorld
}

