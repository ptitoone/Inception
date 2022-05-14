#!/bin/sh

# Install requiered dependencies
apk update;
apk add --no-cache openssh build-base ncurses-dev;

# Download, build and install nsnake
cd /tmp;
wget http://releases.malikania.fr/nsnake/3.0.0/nsnake-3.0.0.tar.xz;
tar -xvf nsnake-3.0.0.tar.xz;
cd nsnake-3.0.0;
make && make install;

# Generate host keys and configure ssh
ssh-keygen -A;
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config;
echo "root:root" | chpasswd;

# Remove install files
rm -r /tmp/*;

