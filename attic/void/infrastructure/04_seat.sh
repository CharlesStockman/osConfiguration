#
# mediating access to shared devices ( grpahical, input ) without requrequiring applicaitons needing to access to be root
#

xbps-install --yes seatd 
ln -s /etc/sv/seatd /var/service
usermod -g _seatd root
usermod -g _seatd cstockman
