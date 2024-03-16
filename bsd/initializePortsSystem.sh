
#
# Initialize the ports systema and pull the repository
#
yes | pkg update
pkg install git

#
# git the repository
#
mkdir -p /usr/ports
git clone https://git.FreeBSD.org/ports.git /usr/ports

# Update ports after the initial checkout 
#git -c /usr/ports pull 
