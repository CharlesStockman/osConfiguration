#
# Setup to use osConfiguration on unix compatible machine
#

if [ -z "${osConfigurationDir}" ] 
then
	echo "Envirionemnt Variable osConfigurationDir does not exist"
	exit 1
fi 

if [ ! -d "${osConfigurationDir}/osConfiguration" ]
then
	echo "osConfiguration does not exist git clone https://github.com/CharlesStockman/osConfiguration.git"
	exit 1
fi

# Create a directory to move the dot files to a safe location when they are overwritten
[ ! -d $HOME/movedFiles ] && mkdir $HOME/movedFiles
 
