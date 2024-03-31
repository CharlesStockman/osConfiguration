#
# Install and setup the audio hardware
#

# Install packages for pipewire installation
xbps-install --yes pipewire wireplumber


mkdir -p -p /etc/pipewire/pipewire.conf.d
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/piepwire.conf.d 
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d


#
# Need to run once in your windoww pipewire, pipewire-pulse, wireplumber
#


