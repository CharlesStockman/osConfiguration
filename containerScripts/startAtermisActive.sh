#
# Artimis is a container continaing activeMQ
#
# This contianer is deperecated and I using it for a course
#
# --privileged -- Give extended privileges to this container   
#
docker run -it --rm --privileged -p8161:8161 -p61616:61616 vromero/activemq-artemis  
