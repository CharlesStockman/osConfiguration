# A script that will be executed everytime a new shell is open.

# Configuration for Java
export JAVA_HOME=/usr/lib64/zulu-openjdk21/bin/java
export PATH=$JAVA_HOME/bin:$PATH

# configuration for maven
. /etc/profile.d/apache-maven.sh

# docker 
#    -d detach from command line
#    -p port shadowing
alias mongo_start="docker run -d -p 20000:27017 --name mongodb mongo:latest"
alias mongo_stop="docker stop mongodb"
alias mongo_remove="docker rm mongodb"

