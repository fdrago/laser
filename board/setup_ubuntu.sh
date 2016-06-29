#!/bin/bash


echo "Installing base packages..."
sudo apt-get update
sudo apt-get install sshfs
sudo apt-get install ssh
sudo apt-get -y install libc6-armel-cross libc6-dev-armel-cross
sudo apt-get -y install binutils-arm-linux-gnueabi
sudo apt-get -y install libncurses5-dev
sudo apt-get -y install gcc-arm-linux-gnueabihf
sudo apt-get -y install g++-arm-linux-gnueabihf
sudo apt-get -y install build-essential libgl1-mesa-dev libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev git

sudo update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-4.8 10 --slave /usr/bin/arm-linux-gnueabihf-g++ arm-linux-gnueabihf-g++ /usr/bin/arm-linux-gnueabihf-g++-4.8

sudo update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-5 20 --slave /usr/bin/arm-linux-gnueabihf-g++ arm-linux-gnueabihf-g++ /usr/bin/arm-linux-gnueabihf-g++-5  

sudo update-alternatives --config arm-linux-gnueabihf-gcc

