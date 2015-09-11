#!/bin/bash

echo Installing Linaro qemu emulator

echo ... installing dependencies
sudo apt-get install libglib2.0-dev zlib1g-dev -y -qq

echo ... cloning qemu-linaro
pushd /tmp
rm -rf qemu-linaro
git clone https://git.linaro.org/qemu/qemu-linaro.git
cd qemu-linaro
echo ...... updating pixman
git submodule update --init pixman
echo ...... updating dtc
git submodule update --init dtc

echo ... building
mkdir build
cd build
../configure --prefix=/usr --target-list=arm-softmmu,arm-linux-user --enable-system --enable-tools --enable-modules
make

echo ... installing
sudo make install --quiet
cd ../../
sudo rm -rf qemu-linaro
popd

echo done.