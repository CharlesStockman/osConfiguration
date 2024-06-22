ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/polkitd /var/service
ln -s /etc/sv/seatd /var/service
usermod -G _seatd root
usermod -G _seatd cstockman
