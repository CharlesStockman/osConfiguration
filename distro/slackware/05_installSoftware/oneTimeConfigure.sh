#
# A script that is execute once shortly after the software has been installed.
#

# Docker
groupadd -r -g 281 docker
usermod -a -G docker cstockman

cat <<- EOF >> /etc/rc.d/rc.local
   if [ -x /etc/rc.d/rc.docker ]; then
    /etc/rc.d/rc.docker start
   fi
EOF
   
cat <<- EOF >> /etc/rc.d/rc.local_shutdown
   if [ -x /etc/rc.d/rc.docker ]; then
	  /etc/rc.d/rc.docker stop
   fi
EOF

docker pull mongo:latest




