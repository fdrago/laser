#!/bin/bash
#set -x

# Go to http://www.osboxes.org/ubuntu/#ubuntu-15_10-vbox
# Download: Ubuntu 15.10 Wily 64bit for virtualbox
# Install the virtualbox additions

QT_DEST_PATH=/opt/Qt
QT48_ARM_DEST_PATH=$QT_DEST_PATH/Qt-Arm-4.8.6
QT48_X86_DEST_PATH=$QT_DEST_PATH/Qt-4.8.6

read -r -p "Do you want to install the qt system and toolchaing (any older version will be removed) ? (y/n) " resp
if [ "$resp" != "y" ];
then
    echo "Exiting..."
    exit
fi

SCRIPT_INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CPUS=`grep -c ^processor /proc/cpuinfo`
QT_SRC_PATH=/tmp/
QT_SRC=$QT_SRC_PATH/QtSrc


echo "Cleaning..."
cd $QT_SRC_PATH
rm -rf $QT_SRC
sudo rm -rf $QT_DEST_PATH
sudo mkdir $QT_DEST_PATH
sudo chown -R $USER.$USER $QT_DEST_PATH


echo "Installing base packages..."
sudo apt-get update
sudo apt-get -y install libc6-armel-cross libc6-dev-armel-cross
sudo apt-get -y install binutils-arm-linux-gnueabi
sudo apt-get -y install libncurses5-dev
sudo apt-get -y install gcc-arm-linux-gnueabihf
sudo apt-get -y install g++-arm-linux-gnueabihf
sudo apt-get -y install build-essential libgl1-mesa-dev libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev

echo "Downloading Qt sources..."
mkdir $QT_SRC
cd $QT_SRC
wget http://ftp.fau.de/qtproject/archive/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz

echo "Extracting qt..."
cd $QT_SRC
tar xzf qt-everywhere-opensource-src-4.8.6.tar.gz
mv qt-everywhere-opensource-src-4.8.6 qt-src-4.8.6-arm
cd qt-src-4.8.6-arm/

echo "Installing and compiling Qt for Acqua A5..."
cp -r $SCRIPT_INSTALL_DIR/linux-arm-gnueabihf-g++ mkspecs/qws/
./configure -embedded arm -xplatform qws/linux-arm-gnueabihf-g++ -little-endian -prefix $QT48_ARM_DEST_PATH -no-qt3support -no-webkit -no-xmlpatterns -no-multimedia -no-audio-backend -no-javascript-jit -no-opengl -nomake demos -nomake examples -declarative -no-fast -no-cups -no-openssl -no-gif -qt-zlib -no-phonon -no-accessibility -opensource -confirm-license
make -j $CPUS
make install

echo "Extracting qt..."
cd $QT_SRC
tar xzf qt-everywhere-opensource-src-4.8.6.tar.gz
mv qt-everywhere-opensource-src-4.8.6 qt-src-4.8.6-x86
cd qt-src-4.8.6-x86/

echo "Installing and compiling Qt for Pc Desktop..."
./configure -prefix $QT48_X86_DEST_PATH -no-qt3support -no-webkit -no-xmlpatterns -no-multimedia -no-audio-backend -no-javascript-jit -no-opengl -nomake demos -nomake examples -declarative -no-fast -no-cups -no-openssl -no-gif -system-zlib -no-phonon -no-accessibility -opensource  -confirm-license
make -j $CPUS
make install


echo "Preparing tarball with qt libraries..."
cd $QT48_ARM_DEST_PATH
tar cfJ $QT_DEST_PATH/arm_qt_libs.tar.gz lib

echo "Qt installed."
echo "Qt ARM libraries available in $QT_DEST_PATH/arm_qt_libs.tar.gz"

echo "Downloading qtcreator"
cd $QT_SRC
wget http://download.qt.io/official_releases/qtcreator/3.6/3.6.0/qt-creator-opensource-linux-x86_64-3.6.0.run
chmod +x qt-creator-opensource-linux-x86_64-3.6.0.run
./qt-creator-opensource-linux-x86_64-3.6.0.run






