#!/bin/bash 
#set -x

source common.sh

echo "Checking Qt sources..."
cd $DOWNLOAD_DIR
if [ -f qt-everywhere-opensource-src-4.8.7.tar.gz ];
then
   echo "Qt 4.8 already here"
else
   echo "Downloading Qt 4.8"
   wget http://mirror.netcologne.de/qtproject/official_releases/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.tar.gz
fi
if [ -f qt-everywhere-opensource-src-5.7.0.tar.xz ];
then
   echo "Qt 4.8 already here"
else
   echo "Downloading Qt 4.8"
   wget http://mirror.netcologne.de/qtproject/official_releases/qt/5.7/5.7.0/single/qt-everywhere-opensource-src-5.7.0.tar.xz
fi

echo "Extracting qt 4.8 for arm..."
cd $DOWNLOAD_DIR
tar xzf qt-everywhere-opensource-src-4.8.7.tar.gz
rm -rf $SRC_DIR/qt-src-4.8.7-arm
mv qt-everywhere-opensource-src-4.8.7 $SRC_DIR/qt-src-4.8.7-arm

echo "Installing and compiling Qt 4.8 for arm..."
cd $SRC_DIR/qt-src-4.8.7-arm
cp -r $SRC_DIR/linux-arm-gnueabihf-g++ mkspecs/qws/
echo "QMAKE_INCDIR  += $BUILD_DIR/tslib/include" >> mkspecs/qws/linux-arm-gnueabihf-g++/tslib.conf
echo "QMAKE_LIBDIR  += $BUILD_DIR/tslib/lib"     >> mkspecs/qws/linux-arm-gnueabihf-g++/tslib.conf
./configure -embedded arm -xplatform qws/linux-arm-gnueabihf-g++ -little-endian -prefix $QT48_ARM_DEST_PATH -no-qt3support -no-webkit -no-xmlpatterns -no-multimedia -no-audio-backend -no-javascript-jit -no-opengl -nomake demos -nomake examples -declarative -no-fast -no-cups -no-openssl -no-gif -qt-zlib -no-phonon -no-accessibility -opensource -confirm-license -qt-mouse-tslib
make -j $CPUS
make install

echo "Extracting qt 4.8 for desktop..."
cd $DOWNLOAD_DIR
tar xzf qt-everywhere-opensource-src-4.8.7.tar.gz
mv qt-everywhere-opensource-src-4.8.7 $SRC_DIR/qt-src-4.8.7-x86
cd $SRC_DIR/qt-src-4.8.7-x86

echo "Installing and compiling Qt 4.8 for Arm..."
./configure -prefix $QT48_X86_DEST_PATH -no-qt3support -no-webkit -no-xmlpatterns -no-multimedia -no-audio-backend -no-javascript-#jit -no-opengl -nomake demos -nomake examples -declarative -no-fast -no-cups -no-openssl -no-gif -system-zlib -no-phonon -no-#accessibility -opensource  -confirm-license
make -j $CPUS
make install

echo "Board and Qt ready."
exit


echo "Extracting qt $QT5_VERSION for arm..."
cd $DOWNLOAD_DIR
tar xf qt-everywhere-opensource-src-5.7.0.tar.xz
rm -rf $SRC_DIR/qt-src-$QT5_VERSION-arm
mv qt-everywhere-opensource-src-$QT5_VERSION $SRC_DIR/qt-src-$QT5_VERSION-arm

echo "Installing and compiling Qt $QT5_VERSION for arm..."
cd $SRC_DIR/qt-src-$QT5_VERSION-arm
cp -r $SRC_DIR/qt5-linux-arm-gnueabihf-g++ qtbase/mkspecs/linux-arm-gnueabihf-g++
echo "QMAKE_INCDIR  += $BUILD_DIR/tslib/include" >> qtbase/mkspecs/linux-arm-gnueabi-g++/tslib.conf
echo "QMAKE_LIBDIR  += $BUILD_DIR/tslib/lib"     >> qtbase/mkspecs/linux-arm-gnueabi-g++/tslib.conf
./configure -v -xplatform linux-arm-gnueabi-g++ -little-endian -prefix $QT57_ARM_DEST_PATH  -no-audio-backend -no-opengl -nomake examples -no-cups -no-openssl -no-gif -qt-zlib -no-accessibility -opensource -confirm-license -no-cups -no-dbus -no-pch -no-nis -nomake examples -nomake tests  -tslib  -no-syslog 
make -j $CPUS
make install

