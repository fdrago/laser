#ifndef ERRORLIST_H
#define ERRORLIST_H

#include <QObject>
#include <QList>
//#include <QtSerialPort/QSerialPort>
#include "qextserialport.h"

class Error : public QObject
{
    Q_OBJECT
public:
    explicit Error();
    ~Error();

    /*bool testOnOff(int idx) {_idx = idx;}
    bool testOnOff() {return _idx}*/

    void id(int id) { _id = id; }
    int id() { return _id; }

    void img(QString img) { _img = img; }
    QString img() { return _img; }

    void msg(QString msg) { _msg = msg; }
    QString msg() { return _msg; }

    void blocco(int blocco) { _blocco = blocco; }
    int blocco() { return _blocco; }

    void limit(float limit) { _limit = limit; }
    float limit() { return _limit; }

    void verso(QString verso) { _verso = verso; }
    QString verso() { return _verso; }

    void color(int color) { _color = color; }
    int color() { return _color; }


    bool active() { return _active; }
    int status(float sts);

    void ack(bool ack) { _ack = ack; }
    bool ackStatus() { return _ack; }

signals:

public slots:

private:
    int _id;
    QString _img;
    QString _msg;
    int _blocco;
    float _limit;
    QString _verso;
    int _color;
    bool _active = false;
    bool _ack = false;

};

class ErrorList : public QObject
{
    Q_OBJECT
public:
    explicit ErrorList(QObject *parent = 0);
    ~ErrorList();

    Q_INVOKABLE void setFan(int sts);
    Q_INVOKABLE void setLaser(int sts);
    Q_INVOKABLE void setLight(int sts);

    Q_INVOKABLE int incPres();
    Q_INVOKABLE int decPres();
    void save();
    void test(float x, int idx);

    Error* getNextError();
    Error* getErrorById( int id );
    void ackError();

    int testAlarm(bool isUnsafe);

    int pressure() { return _pressure_required; }
    void pressureRequired(int pres);


signals:
    void setAmb(double t);
    void setAcq(double t);
    void setHum(double t);
    void setPres(double p);
    void setRealPres(double p);

public slots:
    void readData();
    void request();
    void setAlim(int sts);


private:
    QList<QObject*> _list;
    int _tot_h;
    QextSerialPort *_serial;
    QString _cmd;
    bool cmdComplete;

    int _prevAlarm=-1;

    int _pressure_required = 0;
    double _pressure_real;

    bool _req;

    int loadFile();

};

#endif // ERRORLIST_H
