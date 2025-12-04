#!/bin/zsh

function showHelp() {
  cat << EOF
	Purpose: 
		To download the repositories of a single GitHub user account to multiple directories


	Example Use:
	        Delete all the repositories in a single user account.  Use this command to download the
        	repositories into two directories.  The first directory will be location where all the data
        	will be cleaned up.  The second directory will contain a backup of the repositories

	Arguments:
        	--token         The Github Token used to authenticate the user
        	--help          Show this commented block to allow explain the program to the user.
		The rest of the arguments will be condidered directories.

	Output -- All the repositories in the Github Account are copied to each of the directories listed
EOF
}

function createDirectoryIfNotPresent() {
	local stdinInputs=("$@")
	for directory in $stdinInputs; do
		if [[ ! -d $directory ]]; then
               		# Redirecting Stderr to Stdout and the original stdout is going to /dev/null
			errorMsg=$(mkdir $directory 2>&1 > /dev/null)
			exitCode=$?

			if [[ $exitCode -ne 0 ]]; then
				echo "$0 -- Could not create $directory because $errorMsg"
 				exit 1
			fi
		fi	
	done

}

function verifyEachDirectoryIsReadWrite() {
	local stdinInputs=("$@")
	for directory in $stdinInputs; do
		if [[ ! -r $directory ]]; then
			echo "$0 -- $directory is not readable"
                	exit 1 
        	fi
		
		if [[ ! -w $directory ]]; then
			echo "$0 -- $directory is not writeable"
                	exit 1 
        	fi
	done
}

#
# Setup the parsing of the arguments
#

# Options:
#    -D removed recognized options from the positional parameters
#    -E Continues parsing after encountering unrecognized options or non-option arguments
zparseopts -D -E -- {h,-help}=help {t,-token}:=token

if [[ -n $help ]]; then
  showHelp
  exit 0
fi

createDirectoryIfNotPresent "${@}"
verifyEachDirectoryIsReadWrite "${@}"

# Determine if the variables github authentication token has been set
if [[ ! -n ${token[2]} ]]; then
   echo "$0 -- The Github Authentication Key has not been set to a value.  Use --token arguemnt on the command line to set."
   exit 1 
fi

# Log into the account using the token provide on the command line
errorMsg=$( echo "${token[2]}" | gh auth login --with-token  2>&1 > /dev/null )
exitCode=$?
if [[ $exitCode -ne 0 ]]; then
	echo "$0 -- Could not log into Gihub User Account using token -- ${token[2]}" 
fi

# Get the username account for the github repository 
username=`gh api user --jq '.login'` 

# logout using the username since we cannot use the token to logout.  Using the username because multiple acconts could be opened and a specific account should be closed.
infoMsg=$(gh auth logout --user $username 2>&1 > /dev/null)


# ${@} represents all positional parameters to a script or function.  Note: zparseopts remove recognized options
# ${@} expands to separate words, splits on whitespace
# "$@" expands to separate quoted arguments -- preserves arguments within arugments

#  Example  my_function "${my_array[@]}":
#           my_array - The array variable name
#           [@] - Expands to all elements of the array
#              Each element becomes a separate argument
#           "${...}" -  With quotes "${my_array[@]}" - Each element stays separate, spaces preserved else Without quotes ${my_array[@]} - Elements with spaces get split up
