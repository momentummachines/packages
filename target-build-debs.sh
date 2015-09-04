#!/bin/bash
#
# Run this script on a target to download and compile JSON RPC dependencies into .deb files.

# add to sources.list
echo Adding debian sources to sources.list
sudo echo "deb-src http://ftp.debian.org/debian unstable main" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553

echo Installing apt-src
sudo apt-get install apt-src -y -qq
sudo apt-src update

echo Downloading libjsonrpccpp-dev source
mkdir libjsonrpccpp-dev
cd libjsonrpccpp-dev
apt-src install libjsonrpccpp-dev=0.6.0-2

echo Building libjsonrpccpp
# fix a bug where dependencies are not correctly found
# echo -e "override_dh_shlibdeps:\n\tdh_shlibdeps --dpkg-shlibdeps-params=--ignore-missing-info" >> libjson-rpc-cpp-0.6.0/debian/rules
sed -i 's/		-DCOMPILE_EXAMPLES=YES \\/		-DCOMPILE_EXAMPLES=NO \\ \'$'\n''		-DCOMPILE_TESTS=NO \\ /g' libjson-rpc-cpp-0.6.0/debian/rules
apt-src build libjsonrpccpp-dev

rm -rf libjson-rpc-cpp-0.6.0-2
