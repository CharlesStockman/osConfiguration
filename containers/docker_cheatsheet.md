# Cheatsheet Setup

## Setup

    After installing the docker from repository.

### WHY THE DOCKER NEEDS TO BE IN THE GROUP

The Docker CLI doesn’t do the work itself; it sends requests to the Docker daemon 
(dockerd) over a Unix socket at /var/run/docker.sock. The daemon runs as root, andthe socket is owned by root:docker with mode 660:

        srw-rw---- 1 root docker 0 ... /var/run/docker.sock

Docker’s design is “whoever can talk to the daemon is trusted.” There’s is no per-use authentication on the socket. Instead of making everyone use sudo, the packagers create a docker group so the admin can say “these users may use Docker” using ordinary Unix permissions.

Anyone who can talk to the daemon can effectively become root on the host. 

```
docker run -v /:/host --rm -it alpine chroot /host
```

On development sytems adding the user to the gropu is acceptable 

On production machines either:

|Solution|Description|
|--------|-----------|
| sudo docker | Each time (same power, but gated by sudo’s auth and logging).|
| Rootless Docker or Podman | The daemon runs as your user, so the socket is yours and no group is needed.<br> The tradeoff is some feature limits (privileged ports, certain storage and networking setups).|

    <b>Add the user to group</b>

    ```
        # Become root user
        usermod -append --groups docker <user>
    ```

### Deamons

In order to user docker the docker daemon must run as root

```
   # Assume the current user is root
   dockerd 
```

## List of Command and what they do 

|Command|Description|
|-------|-----------|
| docker -build --tag <tag name> | Creates the image that is identified by the <tag name> |
| docker images | Displayes all images |
| docker image rm \<tag name\>| Removes the image |
| docker run --interactive --tty \<tag name\> | Converts the image into a container and the user is inside the containeer<br><br>--interactive: keeps STDIN open so the container can receive your keystrokes.<br><br>--tty: allocates a pseudo-terminal, so you get a proper shell with a prompt, line editing, colors, and Ctrl+C handling. |
| docker ps --all | Lists all containers that are running or stopped or exitied  |
 | docker rm \<container\> | removes a stopeed container |















