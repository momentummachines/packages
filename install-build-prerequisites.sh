#!/bin/bash
#
# Run this script to install common build dependencies and tools for pacakges

echo Configuring build repos and dependencies.
echo ... installing build tools
sudo apt-get update -y -qq
sudo apt-get install build-essential libtool cmake dh-autoreconf catch -y -qq

echo ... adding debian sources to /etc/apt/sources.list
# if a ports src folder is present but commented, uncomment it
sudo sed -i 's/\#deb-src http\:\/\/ports/deb-src http\:\/\/ports/g'
# add debian source for source builds
export APT_SOURCE="deb-src http://ftp.debian.org/debian unstable main"
grep -q -F "$APT_SOURCE" /etc/apt/sources.list || sudo sh -c "echo $APT_SOURCE >> /etc/apt/sources.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553

echo ... updating sources
sudo apt-get update -q

echo done.
