#!/bin/bash
#
# Device tree compiler compiled from Robert Nelson script.

pushd /tmp >/dev/null
sudo apt-get remove -y -qq device-tree-compiler
wget -c -q https://raw.githubusercontent.com/RobertCNelson/tools/master/pkgs/dtc.sh
chmod +x dtc.sh
./dtc.sh >/dev/null
popd >/dev/null
