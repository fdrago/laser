#ifndef LASERMODEL_H
#define LASERMODEL_H

#include "qtquick1applicationviewer.h"
#include <QObject>
#include <QTimer>
#include <QList>
#include <QThread>
#include <QDebug>

#include "led.h"
#include "errorlist.h"

#include "modbus.h"
#include "userlist.h"
#include "user.h"
#include "logger.h"


class LaserModel : public /*QObject*/ QThread
{
    Q_OBJECT

/*protected:

    virtual void run();*/

public:



    explicit LaserModel(QObject *parent = 0);
    void setViewer(QtQuick1ApplicationViewer * viewer);

    Q_INVOKABLE void setDate(const int yy, const int MM, const int day, const int hh, const int mm);

    Q_INVOKABLE void guiState(const QString &newState);

    Q_INVOKABLE void moveStop();
    Q_INVOKABLE void moveXplus();
    Q_INVOKABLE void moveXminus();
    Q_INVOKABLE void moveYplus();
    Q_INVOKABLE void moveYminus();
    Q_INVOKABLE void moveZplus();
    Q_INVOKABLE void moveZminus();
    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void resume();

    Q_INVOKABLE void shoot();
    Q_INVOKABLE void test();
    Q_INVOKABLE void cutContour();

    Q_INVOKABLE void setFan(int sts);
    Q_INVOKABLE void setLight(int sts);
    Q_INVOKABLE void setLaser(int sts);

    Q_INVOKABLE void incPres();
    Q_INVOKABLE void decPres();

    Q_INVOKABLE void login(QString codice);
    //Q_INVOKABLE void Firstlogin();


    Q_INVOKABLE void printCurrentFile();
    Q_INVOKABLE void callGetFilesList();
    Q_INVOKABLE void getFilesList();
    Q_INVOKABLE void getUsbList(int number);
    Q_INVOKABLE void deleteFile();
    Q_INVOKABLE void setFile(int num);

    Q_INVOKABLE void setName(int idx, QString name);
    Q_INVOKABLE void setPwd(int idx, QString pwd);
    Q_INVOKABLE void setLevel(int idx, int level);

    Q_INVOKABLE void setClearWater();
    Q_INVOKABLE void setClearGuide();
    Q_INVOKABLE void setClearFilter();
    Q_INVOKABLE void setAlarmOff(int sts);

    Q_INVOKABLE void setStatus(QString sts);

    Q_INVOKABLE void uploadFile(int idFile);
    Q_INVOKABLE void stopTimerLaser();

    Q_INVOKABLE void log(QString s);

    Q_INVOKABLE bool getErrNONC( int id );
    Q_INVOKABLE int getErrVal( int id );
    Q_INVOKABLE QString getErrString( int id );
    Q_INVOKABLE void setErrNONC( int id, bool val);
    Q_INVOKABLE void setErrVal( int id, int val );


signals:
    void stateChanged(const QString &newState);
    void enableButton(const int &eb);
    void allarme(const int &alarm, const bool stato);
    void mbSignalWriteBit(int reg, int sts);

public slots:
    void mbSlotWriteBit(int reg, int sts);
    void doRefreshUser();
    void doComplete();
    void showAlarm();
    void setAmb(double t);
    void setAcq(double t);
    void setHum(double t);
    void setPres(double p);
    void setRealPres(double p);
    void alarm(QString led);
    void noalarm(QString led);
    void setLed(QString led);
    void resetLed(QString led);
    void ackAlarm();
    void updateLan();

private:
    QtQuick1ApplicationViewer * _viewer;
    modbus_t *mb;
    UserList *_userlist;
    User * _currentUser;
    QString language = "it";
    QString _status;
    QString _prevStatus;

    Logger *_logger;
    ErrorList *_error;
    bool _lamp_usb;
    bool _menu_usb;
    int _prevUsbFile;

    QTimer *_timer;
    QTimer *_timerLaser;
    QTimer *_timerAlarm;

    int _countAlarm=0;
    int _currentAlarmIndex=-1;
    int _countUsb;
    bool _alarmUnsafe;

    bool isStarted=false;

    bool _timerLaserFlag;
    QTimer *timer;
    Error* _currentError;

};

#endif // LaserModel_H
