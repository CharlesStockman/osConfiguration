#!/bin/sh

#
# Purpose : To provide information about a packagei(s)
#
# input : Either one package from the command line or a list of packages through stdin
# output: Either information about each package or a line stating it does not exist
#
# Can use either command line or STDIN, but not both.
#


#
# Get information about a package and display it on the screen.  Will dispaly errors
# when the package does not exit
#
function getInfo() {
   brew info $1 
   if [ $? -ne 0 ] 
   then
      echo "$1 does not exist"
   fi
}

if [ -t 0 ] 
then
   if [ $# -eq 0 ] 
   then
	echo "Must include a package name when using the command line arguments"
	exit -1
   else
   	if [ $# -eq 1 ] 
   	then
     		getInfo $1 
   	fi
   fi
else
   while read line 
   do 
     echo "-------------------------------"
     if [ -n $line ] 
     then 
       getInfo $line 
     fi
   done
fi

