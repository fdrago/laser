#!/bin/bash
#set -x

source common.sh

echo "Extracting and pathcing kernel sources..."
if [ -f linux-3.10-at91.zip ];
then
    echo "Kernel already downloaded"
else
    echo "Downloading kernel"
    wget https://github.com/linux4sam/linux-at91/archive/linux-3.10-at91.zip -O $DOWNLOAD_DIR/linux-3.10-at91.zip
fi
unzip -q $DOWNLOAD_DIR/linux-3.10-at91.zip -d $BUILD_DIR
rm -rf  $BUILD_DIR/linux-3.10-acqua
mv $BUILD_DIR/linux-at91-linux-3.10-at91 $BUILD_DIR/linux-3.10-acqua
cd $BUILD_DIR/linux-3.10-acqua
patch -p1 < $SRC_DIR/acme.patch
cp $SRC_DIR/acme-acqua_lcd_70.dts arch/arm/boot/dts
cp $SRC_DIR/acme-acqua_defconfig arch/arm/configs
make ARCH=arm acme-acqua_defconfig
cp $SRC_DIR/dot.config .config


echo "Compiling kernel sources..."
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- acme-acqua_lcd_70.dtb
make -j8 ARCH=arm  CROSS_COMPILE=arm-linux-gnueabihf- zImage
make modules -j8 ARCH=arm  CROSS_COMPILE=arm-linux-gnueabihf-
make modules_install INSTALL_MOD_PATH=./modules ARCH=arm
 
