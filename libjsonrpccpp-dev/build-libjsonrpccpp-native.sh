#!/bin/bash
#
# Run this script on a target to download and compile JSON RPC dependencies into .deb files.
# The native system must have all of the JSON dependencies installed for the build to succeed.
#
# Note: this package requires libargtable2-dev to build.

# download and build
echo ... downloading libjsonrpccpp-dev source
apt-get source libjsonrpccpp-dev=0.6.0-2 -q
echo ... building libjsonrpccpp
cd libjson-rpc-cpp-0.6.0
dpkg-buildpackage -us -uc
# remove downloaded from apt-get source
cd ..
rm -rf libjson-rpc-cpp-0.6.0
echo done.
