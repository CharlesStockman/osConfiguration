#
# Purpose to update the system to the most current slackware-current
# clean-system -- It is not working correctly and needs more research
#
# Run the writeBlocker.sh first so the kernel is not updated.  Usually
# updating the kernel when updating everything else can ruin a build.
# 
cd /usr/sbin

./slackpkg update gpg
./slackpkg update
./slackpkg
./slackpkg upgrade-all
./slackpkg install-new
#./slackpkg clean-system

