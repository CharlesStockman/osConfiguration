#
# Install and setup the audio hardware
#

# Install packages for pipewire installation
xbps-install --yes pipewire wireplumber


mkdir -p /etc/alsa/conf.d

ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-defualt.conf /etc/alsa/conf.d

sed -i "s/;\ autospawn\ \= no/autospawn\ =\ no/g /etc/pulse/client.conf

#
# Need to run once in your windoww pipewire, pipewire-pulse, wireplumber
#


