#-------------------------------------------------
#
# Project created by QtCreator 2016-03-18T23:36:01
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = laserV2
TEMPLATE = app


include(3rdparty/qextserialport/qextserialport.pri)


SOURCES += main.cpp\
        mainwindow.cpp \
    user.cpp \
    userlist.cpp \
    lasermodel.cpp \
    3rdparty/libmodbus/src/modbus-data.c \
    3rdparty/libmodbus/src/modbus-rtu.c \
    3rdparty/libmodbus/src/modbus-tcp.c \
    3rdparty/libmodbus/src/modbus.c \
    led.cpp \
    errorlist.cpp


HEADERS  += mainwindow.h \
    user.h \
    userlist.h \
    lasermodel.h \
    3rdparty/libmodbus/src/config.h \
    3rdparty/libmodbus/src/modbus-private.h \
    3rdparty/libmodbus/src/modbus-rtu-private.h \
    3rdparty/libmodbus/src/modbus-rtu.h \
    3rdparty/libmodbus/src/modbus-tcp-private.h \
    3rdparty/libmodbus/src/modbus-tcp.h \
    3rdparty/libmodbus/src/modbus-version.h \
    3rdparty/libmodbus/src/modbus.h \
    3rdparty/libmodbus/config.h \
    led.h \
    errorlist.h \
    ledtype.h

INCLUDEPATH += libmodbus/src

FORMS    += mainwindow.ui


PRE_TARGETDEPS += FORCE
