#
# Install the nixOs package manager
#

mkdir -m 0755 ~/.nix
nix-user-chroot ~/.nix bash -c `curl -L https://nixos.org/nix/install | sh`
