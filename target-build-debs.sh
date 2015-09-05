#!/bin/bash
#
# Run this script on a target to download and compile JSON RPC dependencies into .deb files.
#
# Run this script as sudo user.

# add to sources.list
echo Adding debian sources to sources.list
export APT_SOURCE="deb-src http://ftp.debian.org/debian unstable main"
grep -q -F "$APT_SOURCE" /etc/apt/sources.list || echo $APT_SOURCE >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553

echo Installing apt-src
apt-get install apt-src -y -qq
apt-src update

echo Downloading libjsonrpccpp-dev source
pushd /tmp
mkdir libjsonrpccpp-dev
cd libjsonrpccpp-dev
apt-src install libjsonrpccpp-dev=0.6.0-2

echo Building libjsonrpccpp
apt-src build libjsonrpccpp-dev

cd ..
rm -rf libjsonrpccpp-dev
popd

