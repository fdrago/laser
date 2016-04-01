#ifndef LED_H
#define LED_H

#include <QObject>
//#include <QtSerialPort/QSerialPort>
#include "qextserialport.h"
#include <QMutex>

#define GREEN  "0f0"
#define RED    "f00"
#define YELLOW "ff0"

#include "ledtype.h"

class Led : public QObject
{
    Q_OBJECT
public:
    explicit Led(QObject *parent = 0);
    ~Led();

    void setLed(QString spia, bool sts);

signals:


public slots:
    void readData();

private:
    //QSerialPort * _serial;

    QextSerialPort *  _serial;

    bool _doneCmd;
    bool cmdComplete;
    QString _cmd;
    QString _lastCmd;
    QMutex _mutex;
    bool _serok;

};

#endif // LED_H
