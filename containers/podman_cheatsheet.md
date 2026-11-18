## Introduction
Podman is an open-source container engine for building, running, and managing containers and pods on Linux. 
<b>Largely compatible with</b>

<ul>
  <li>Docker’s CLI
    <ol>
      <li>  Most docker commands work by simply swapping in podman</li>
      <li>alias it: alias docker=podman</li>
    </ol>
  </li>
  <li>image formats (OCI standard)</li>
</ul>

<b>Key differences from Docker</b>

<ul>
  <li>Daemonless
    <ol>
      <li>Docker relies on a long-running background daemon (dockerd)</li>
      <li>Podman doesn’t; each container is a child process of the command that launched it ( There’s no single privileged process to crash or attack.</li>
    </ol>
  </li>
  <li>Rootless by default
    <ol>
     <li>Run containers as a regular user using user namespaces, so a container escape doesn’t hand over root on the host.</li>
    </ol>
  </li>
  <li>Pods: Like Kubernetes, Podman can group containers into pods that share a network namespace. 
    <ol>
      <li>Can also generate Kubernetes YAML from running containers (podman generate kube)</li>
      <li>Run Kubernetes YAML directly (podman kube play).</li>
    </ol>
  </li>
</ul>

## Notes

If "podman images" displays an image with the prefix local host that means the image is in the registry on the local machine

## Commands

|Comamnd|Description|
|-------|-----------|
|podman run quay.io/podman/hello | Verifies that podman is working correctly and rm the quay.io/podman/hello:latest |
|podman info | provides information about the podman environment in YAML Format|
|podman build --tag void_package_builder . |  Executes the Dockerfile to create the image |
| podman run --tty --interactive open-adventure:podman --name=adventure /bin/bash | This starts an interactive Bash shell inside a container built from a local image called open-adventure:podman.<br><br>--interactive: keeps STDIN open so the container can receive your keystrokes<br><br>--tty: allocates a pseudo-terminal, so you get a proper shell with a prompt, line editing, colors, and Ctrl+C handling.<br><br>--name allows the developer to name the container which are good for:<br><ul><li>Running commands against it -- don’t need to look up the ID or the random generated name first.</li><li>Container to Container DNS (podman network create mynet, then --network mynet), containers resolve each other by name. A client container can connect to db:5432 and it works, with no IP addresses to track.</li><li>Scripts and automation. A fixed name lets scripts reliably start, stop, or check on a container: podman container exists web && podman rm -f web.</li><li>Preventing duplicates. Since names must be unique, --name acts as a guard against accidentally starting two copies of the same service.</li></ul>|
|podman run  --interactive --tty --mount type=bind,<br>source=/home/cstockman/containers/void_package_builder_common_dir,<br>target=/home/builder/containers/void_package_builder_common_dir<br> --userns=keep-id --name=package-builder void-package-builder /bin/bash |--mount Associates a directory on the host with a direcotry on the container<br><br>--userns=keep-id, which maps your host uid to the same uid inside the container. Your Dockerfile already creates builder with uid 1000, so with a host uid of 1000 files are owned by you on the host and by builder|
| podman ps | Shows the running container(s) |
| podman login quay.io --username | Will prompt for a password and on successful authentication the user will be logged in a user account on quay.io |
| podman push open-adventure:podman quay.io/dougtidwell openadventure:podman| pushed the image to quay.io ( must be logged in )
| podman rmi --all | Delete all images |
| podman stop --all && podman rm --all | Stop and remove all instances |


