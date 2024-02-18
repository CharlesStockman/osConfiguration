# 
# Install the tools that will be used to install new software

# Get instructions and code needed to build sbotools
wget http://pink-mist.github.io/sbotools/downloads/sbotools-2.7.tar.gz
wget http://slackbuilds.org/slackbuilds/15.0/system/sbotools.tar.gz

# Create the directory and prepare sbotools.Slackbuild to be executed
tar xvf sbotools.tar.gz
cp sbotools-2.7.tar.gz sbotools
cd sbotools
chmod + sbotools.SlackBuild

# Build sbtools package and install
./sbotools.SlackBuild
installpkg /tmp/sbotools*.tgz

# Clean up 
cd ..
rm -rf sbotools
rm sbotools*.*

