#include "led.h"
//#include <QtSerialPort/QSerialPort>
#include "qextserialport.h"
#include <QThread>
#include <QDebug>

Led::Led(QObject *parent) : QObject(parent)
{
    _serial = new QextSerialPort("COM1");
    connect(_serial, SIGNAL(readyRead()), this, SLOT(readData()));

#ifdef QT_DEBUG
    _serial->setPortName("/dev/ttyUSB1");
#else
    _serial->setPortName("/dev/ttyS5");
#endif
    if (_serial->open(QIODevice::ReadWrite)) {
        qDebug() << "Serial led ok";
        _serok = true;
    } else {
        qDebug() << "Serial led FAIL" << _serial->lastError() << _serial->errorString();
        _serok = false;
    }
    _serial->setBaudRate(BAUD19200);
}

Led::~Led()
{
    _serial->close();

}

void Led::setLed(QString spia, bool sts)
{
    QString color;
    if(sts==ON){
        if(spia== SPIA_ON) color=GREEN;
        else if(spia== SPIA_WIFI) color=GREEN;
        else if(spia== SPIA_T_AMB_ALTA) color=YELLOW;
        else if(spia== SPIA_T_ACQ_ALTA) color=YELLOW;
        else if(spia== SPIA_VALVOLA) color=YELLOW;
        else if (spia== SPIA_UMIDITA) color=YELLOW;
        else if (spia== SPIA_FILTRO) color=YELLOW;
        else if (spia== SPIA_MOVIMENTO) color=YELLOW;
        else if (spia== SPIA_LASER) color=RED;
        else if (spia== SPIA_SICUREZZE_OFF) color=RED;

        else if (spia== SPIA_USB) color=GREEN;
        else if (spia== LAMP_USB) color=GREEN;
        else if (spia== SPIA_ETHERNET) color=GREEN;
        else if (spia== SPIA_T_AMB_BASSA) color=YELLOW;
        else if (spia== SPIA_T_ACQ_BASSA) color=YELLOW;
        else if (spia== SPIA_ACQUA) color=YELLOW;
        else if (spia== SPIA_PULIRE_GUIDE) color=YELLOW;
        else if (spia== SPIA_VENTOLE) color=YELLOW;
        else if (spia== SPIA_SPORTELLO) color=RED;
        else if (spia== SPIA_FUOCO) color=RED;
        else if (spia== SPIA_ARIA) color=YELLOW;
        else if (spia== SPIA_ROOT) color=YELLOW;
        else if (spia== SPIA_MANUTENZIONE) color=YELLOW;
    } else {
        color = "000";
    }

    QByteArray dato= QString(spia+color+"\n").toLatin1();

    qDebug() << __FUNCTION__ << dato;

    _lastCmd = QString(spia+color+"\n");

    if(_serok) {
        _serial->write(dato);

        _serial->waitForReadyRead(200);
    }

}

void Led::readData()
{

    int numBytes = _serial->bytesAvailable();
    _serial->readAll();

/*
    if(numBytes==0) return;

    bool loop = true;
    while(loop) {
        QByteArray data = _serial->read(1);

        numBytes--;
        if(data.at(0) == 0x0d)
            cmdComplete = true;
        else if(data.at(0) == 0x0a)
            cmdComplete = true;
        else
            _cmd.append(data);

        if(numBytes==0)
            loop=false;

        if(cmdComplete) {
            qDebug() << "Led" << _cmd;

            _cmd = "";
            cmdComplete=false;
        }
    }
*/

}

