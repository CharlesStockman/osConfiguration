#!/bin/sh

# Verfiy that the file exist 
if [ -d "$1" ]; then
	directory=$1
else
	echo "The user of $0 must input a directory"
	exit 1
fi

# Change to a new working direcotry
cd ../../void-packages

# Copy the directory to allow void to build the package  
cp --recursive $directory srcpkgs/tuios

# xlint will review the template and verify that it is correct
xlint srcpkgs/$directory
if [ $? -ne 0 ]; then
	echo "xlint found some issues please fix the issues and run again"
	exit 2
fi

# Build the package
$HOME/void-packages/xbps-src pkg $directory

# Copy the package to the common directory used by host and the container so the host can access it
cp hostdir/binpkgs/$directory* ../containers/void_package_builder_common_dir
