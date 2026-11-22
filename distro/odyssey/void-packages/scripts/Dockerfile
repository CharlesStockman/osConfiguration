FROM ghcr.io/void-linux/void-glibc-full:latest

# Always update xbps first or the packages will not install or update
RUN xbps-install --sync --yes xbps && xbps-install --sync --yes git xtools curl util-linux bash zstd bubblewrap vim

# Create a user since xbps-src refuses to run as Root

#
# In order to have the host and container have a common directory to transfer files the user of the host and the user
# of the container must have the same UID then the --mount can associate a host directory with a contianer directory 
#
ARG UID=1000
RUN useradd --create-home --uid ${UID} builder 
USER builder

# Clone the void-packages
WORKDIR /home/builder
RUN git clone https://github.com/void-linux/void-packages.git

RUN mkdir -p containers/void_package_builder_common_dir

# Create the isolated environment ( masterdir) which is small root filesysystem containing the compiler toolchain
# and base tools ( gcc, make, coreutils etc.. ) and xbps-src enters it using linux namespaces
#WORKDIR /home/builder/void-packages
#RUN ./xbps-src binary-bootstrap 
