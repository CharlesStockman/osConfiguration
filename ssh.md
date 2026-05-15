# Introduction

SSH (Secure Shell) is a network protocol that lets you securely connect to and communicate with another computer over a network.
The standard port number is 22.

Creates an encrypted tunnel between two machines, so everything sent through it (passwords, commands and files) is protected from anyone who might be watching the network.

```
Your Machine                        Remote Machine
    |                                     |
    |------- "Hey, let's connect" ------->|
    |<------ "Here's my public key" ------|
    |------- "Verified, here's mine" ---->|
    |                                     |
    |====== Encrypted tunnel open ========|
    |                                     |
    |--- commands, files, passwords ----->|  ← all encrypted
```
It uses asymmetric cryptography to establish the connection, then switches to a faster symmetric key for the actual data transfer.

<b>Components</b>
|Component|Description|
|---------|-----------|
|SSH Daemon (sshd)|Background service running on the server (the machine being connected to), waiting for incoming connections.|
|SSH Client|tool on your machine (ssh command) that initiates the connection.|
|Key pair|Public/private key pair you generate with ssh-keygen. This is an alternative to passwords and is more secure.|

# Prerequisites

## Macintosh

<b>Determine if Remote Login is on or off</b>
```
sudo systemsetup -getremotelogin
```

<b>Turn Remote Login on </b>
```
sudo systemsetup -setremotelogin on
```

<b>Get Address the correct the network interface en1</b>
```
ipconfig getifaddr en1
```
