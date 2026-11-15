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

## Commands

|Comamnd|Description|
|-------|-----------|
|podman run quay.io/podman/hello | Verifies that podman is working correctly and rm the quay.io/podman/hello:latest |
|podman info | provides information about the podman environment in YAML Format|
