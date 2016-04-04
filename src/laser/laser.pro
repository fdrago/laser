# Add more folders to ship with the application, here
folder_01.source = qml/laser
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH=/usr/lib/x86_64-linux-gnu/qt5/qml
 
# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    errorlist.cpp \
    lasermodel.cpp \
    led.cpp \
    user.cpp \
    userlist.cpp \
    libmodbus/src/modbus.c \
    libmodbus/src/modbus-data.c \
    libmodbus/src/modbus-rtu.c \
    libmodbus/src/modbus-tcp.c

INCLUDEPATH += libmodbus/src


include(qtquick1applicationviewer/qtquick1applicationviewer.pri)
include(qextserialport/qextserialport.pri) 

HEADERS += \
    errorlist.h \
    lasermodel.h \
    led.h \
    ledtype.h \
    pugixml.hpp \
    user.h \
    userlist.h \
    libmodbus/src/config.h \
    libmodbus/src/modbus.h \
    libmodbus/src/modbus-private.h \
    libmodbus/src/modbus-rtu.h \
    libmodbus/src/modbus-rtu-private.h \
    libmodbus/src/modbus-tcp.h \
    libmodbus/src/modbus-tcp-private.h \
    libmodbus/src/modbus-version.h

DISTFILES += \
    qml/laser/About.qml \
    qml/laser/Alarm.qml \
    qml/laser/Alphabet.qml \
    qml/laser/Button.qml \
    qml/laser/Buttonsmall.qml \
    qml/laser/Config.qml \
    qml/laser/FileChoose.qml \
    qml/laser/FileUpload.qml \
    qml/laser/Gauge.qml \
    qml/laser/Gauges.qml \
    qml/laser/Joystick.qml \
    qml/laser/Login.qml \
    qml/laser/LoginRFID.qml \
    qml/laser/main.qml \
    qml/laser/StartStopTest.qml \
    qml/laser/StopPauseResume.qml \
    qml/laser/Toolbar.qml \
    qml/laser/Utility.qml \
    qml/laser/YesNo.qml