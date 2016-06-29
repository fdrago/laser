#!/bin/bash 
#set -x

source common.sh

echo "Cloning repo..."
rm -rf $DOWNLOAD_DIR/gsl1680
cd $DOWNLOAD_DIR
git clone https://github.com/mariosgn/gsl1680.git

echo "Compiling"
cd $DOWNLOAD_DIR/gsl1680
make CC=arm-linux-gnueabihf-
