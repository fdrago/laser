#!/bin/bash 
set -x


source common.sh

echo "Compiling tslib for arm..."
cd $DOWNLOAD_DIR
rm -rf tslib
git clone https://github.com/kergoth/tslib.git
cd $DOWNLOAD_DIR/tslib
./autogen.sh 
./configure CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++ -host=arm-none-linux-gnueabi target=arm-none-linux-gnueabi -enable-static=yes -enable-shared=yes --prefix=$BUILD_DIR/tslib
make -j $CPUS
make install

echo "Tslib ready."

