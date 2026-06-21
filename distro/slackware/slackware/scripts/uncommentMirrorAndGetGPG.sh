
selectMirror() {
	# Get the last line of the file 
	last_line=$(wc -l /etc/slackpkg/mirrors | cut -f1 -d' ')

	# Remove the comment symbol ( first # )
	sed -i "${last_line}s/^#//" /etc/slackpkg/mirrors
}

# Select the mirro where the official changes will be downloaded from. 
selectMirror

# Download the gpg keys
yes | slackpkg update gpg 
