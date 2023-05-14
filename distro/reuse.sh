#!/bin/bash

#
# Install all software package groups
#
function installAll {
   #
   # Installs software from different package installers
   #    Parameter 1 : The executable for the package manager
   #    Parameter 2 : The associative array containing the package names to be extracted.
   #    Parameter 3 : A string that desbribe the type of packages being extracted.
   #
   function installs() {
     local installFunction=$1
     local installList=$2 
     local description=$3

     for item in $installList 
     do
        echo "*************** $description $item"
        $installFunction $item 
     done
  }

  softwareList=$(echo `jq '.install.software | flatten' repository.json` | sed 's/[\[,"]//g' | sed 's/\]//g' )
  installs  "installPackage" "$softwareList" "software being installed:"
  

  #installs installPip pipList "pipList"
  #installs installGlobalNpm globalNpmList "globalNpmList"
  #startDocker
  #installs installDockerImage "dockerList"
  #stopDocker
}

#
# Install gloal npm packages
#
function installGlobalNpm {
   npm install --global $1
}

#
# Install a docker image
#
function installDockerImage {
  docker pull $1
}

#
# Function install python libraries and applications
#
function installPip {
  pip install $1
}

#
# Convert a comma separated string into an array
#
function startDaemons {
  daemonArray=($(echo $config_daemon | tr "," "\n"))
  for string in "${daemonArray[@]}"
  do
	echo $string
	eval "$string &"
  done 
}

#
# Start the Docker Daemon
#
function startDocker {
	dockerd &
	sleep 5
}

#
# Stop the Docker Daemon
#
function stopDocker {
	pkill dockerd
}

