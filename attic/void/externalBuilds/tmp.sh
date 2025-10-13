#
# Install all packages that were built
#

install_directory=$BUILD_TOP_LEVEL_DIR/void-packages/hostdir/binpkgs
cd $install_directory
for package_with_extension in `ls $install_directory`
do
        package=$(echo $package_with_extension | sed 's/\.xbps//g')
        package=$(echo $package  | sed 's/\-[0-9].*$//g')
	sudo xbps-install --yes -R $install_directory $package
done  
