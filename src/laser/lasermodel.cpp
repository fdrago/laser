#include "lasermodel.h"
#include "errorlist.h"
#include <QDeclarativeContext>
#include <QDebug>
#include <QThread>
#include <QStringList>
#include <QStringListModel>
#include <QtNetwork/QNetworkInterface>
#include <QElapsedTimer>
#include <QFile>
#include <QProcess>



LaserModel::LaserModel(QObject *parent) :
    QThread(parent)
{
    _userlist = new UserList;
    _userlist->load();

    _error = new ErrorList;

    _menu_usb = false;
    _countUsb = 0;

    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(updateLan()));
    timer->start(10000);

    connect(this, SIGNAL(mbSignalWriteBit(int,int)), this, SLOT(mbSlotWriteBit(int,int)));

    connect(_userlist, SIGNAL(listChanged()), this, SLOT(doRefreshUser()));
    connect(_error, SIGNAL(setAcq(double)), this, SLOT(setAcq(double)));
    connect(_error, SIGNAL(setAmb(double)), this, SLOT(setAmb(double)));
    connect(_error, SIGNAL(setHum(double)), this, SLOT(setHum(double)));
    connect(_error, SIGNAL(setPres(double)), this, SLOT(setPres(double)));
    connect(_error, SIGNAL(setRealPres(double)), this, SLOT(setRealPres(double)));
    connect(_error, SIGNAL(alarm(QString)), this, SLOT(alarm(QString)));
    connect(_error, SIGNAL(noalarm(QString)), this, SLOT(noalarm(QString)));
//    connect(_error, SIGNAL(setLed(QString)), this, SLOT(setLed(QString)));
//    connect(_error, SIGNAL(resetLed(QString)), this, SLOT(resetLed(QString)));


}

void LaserModel::setViewer(QtQuick1ApplicationViewer *viewer)
{
    qDebug() << "ver 1.3";

    _viewer = viewer;
    _timer = new QTimer(this);
    connect(_timer, SIGNAL(timeout()), _error, SLOT(request()));

    _timerLaser = new QTimer(this);
    connect(_timerLaser, SIGNAL(timeout()), this, SLOT(doComplete()));

    _timerAlarm = new QTimer(this);
    connect(_timerAlarm, SIGNAL(timeout()), this, SLOT(showAlarm()));

#ifdef QT_DEBUG
    mb = modbus_new_rtu("/dev/ttyUSB0",9600,'N',8,1);
#else
    mb = modbus_new_rtu("/dev/ttyS2",9600,'N',8,1);
#endif
    if(mb==NULL) {
        qDebug() << "Errore modbus";
        return;
    }

    qDebug() << "mb = " << mb;

    modbus_connect(mb);
    modbus_set_slave(mb, 1);

/*    _led.setLed("TZ", OFF);

    _led.setLed(SPIA_ON, ON);
    _led.setLed(SPIA_ON, ON);*/

    QStringList fileList;
    _viewer->rootContext()->setContextProperty("usbFileModel", QVariant::fromValue(fileList));


    _viewer->rootContext()->setContextProperty("userList", _userlist);
    _viewer->rootContext()->setContextProperty("usersModel", QVariant::fromValue(_userlist->userlist()));


    setFan(1);
    setLight(1);
    setLaser(1);

    getFilesList();

    printCurrentFile();

    setAcq(0.0);
    setAmb(0.0);
    setHum(0);
    setPres(0.7);

    _timerLaserFlag = false;
    _timer->start(1000);
    _timerLaser->start(500);
    //QThread::start();
    _timerAlarm->start(3000);

}


/*void LaserModel::run()
{
    while(1)
    {
        doComplete();
        usleep(500);
        qDebug() << "sonoqua";
    }

}*/


void LaserModel::guiState(const QString &newState)
{

    qDebug() << "Cambio stato" << newState;

    emit stateChanged(newState);
}

void LaserModel::moveStop()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 4, 0);
    emit mbSignalWriteBit( 5, 0);
    emit mbSignalWriteBit( 7, 0);
    emit mbSignalWriteBit( 6, 0);
    emit mbSignalWriteBit(20, 0);
    emit mbSignalWriteBit(21, 0);
}

void LaserModel::moveXplus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 4, 1);
//    _led.setLed(SPIA_MOVIMENTO, YELLOW);
}

void LaserModel::moveXminus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 5, 1);
//    _led.setLed(SPIA_MOVIMENTO, YELLOW);
}

void LaserModel::moveYplus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 7, 1);
//    _led.setLed(SPIA_MOVIMENTO, YELLOW);
}

void LaserModel::moveYminus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 6, 1);
//    _led.setLed(SPIA_MOVIMENTO, YELLOW);
}

void LaserModel::moveZplus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit(20, 1);
//    _led.setLed(SPIA_MOVIMENTO, YELLOW);
}

void LaserModel::moveZminus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit(21, 1);
//    _led.setLed(SPIA_MOVIMENTO, YELLOW);
}

void LaserModel::start()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 0, 1);
}

void LaserModel::stop()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 3, 1);
}

void LaserModel::pause()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 1, 1);
}

void LaserModel::resume()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 2, 1);
}

void LaserModel::shoot()
{
    qDebug() << __FUNCTION__;
//    _led.setLed(SPIA_MOVIMENTO, OFF);
//    _led.setLed(SPIA_LASER, ON);
    emit mbSignalWriteBit(19, 1);
    QThread::msleep(500);
    emit mbSignalWriteBit(19, 0);
//    _led.setLed(SPIA_MOVIMENTO, OFF);
//    _led.setLed(SPIA_LASER, OFF);
}

void LaserModel::test()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit(17, 1);
}

void LaserModel::cutContour()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit(18, 1);
}

void LaserModel::setFan(int sts)
{
    _viewer->rootContext()->setContextProperty("FanSts", sts);
    _viewer->rootContext()->setContextProperty("uFanSts", sts);
    sts = (sts) ? 0: 1;
    _error->setFan(sts);
//    if(sts==1)
//        _led.setLed(SPIA_VENTOLE, ON);
//    else
//        _led.setLed(SPIA_VENTOLE, OFF);
}

void LaserModel::setLight(int sts)
{
    _viewer->rootContext()->setContextProperty("LightSts", sts);
    _viewer->rootContext()->setContextProperty("uLightSts", sts);
    sts = (sts) ? 0: 1;
    _error->setLight(sts);
}

void LaserModel::setLaser(int sts)
{
    _viewer->rootContext()->setContextProperty("LaserSts", sts);
    _viewer->rootContext()->setContextProperty("uLaserSts", sts);
    sts = (sts) ? 0: 1;
    _error->setLaser(sts);
}

void LaserModel::incPres()
{
    _error->incPres();
}

void LaserModel::decPres()
{
    _error->decPres();
}

void LaserModel::login(QString codice)
{
    if(codice == "9666") {
        _currentUser->name("ADMIN");
        _currentUser->level(10);
        emit stateChanged("File");

    } else if(_userlist->contains(codice)) {
        _currentUser = _userlist->value(codice);
        _viewer->rootContext()->setContextProperty("username", _currentUser->name());
        _viewer->rootContext()->setContextProperty("usertime", _currentUser->time());

//        qDebug() << _currentUser->level();
        _viewer->rootContext()->setContextProperty("userlevel", _currentUser->level());
        if(_currentUser->level() == 10) {
//            _led.setLed(SPIA_ROOT, ON);
        } else {
//            _led.setLed(SPIA_ROOT, OFF);
        }

        emit stateChanged("File");
        _timerLaserFlag = true;

    } else {
        emit stateChanged("");
        emit stateChanged("Login");
    }
}

void LaserModel::printCurrentFile()
{
    uint16_t tab_reg[64];

    modbus_read_registers(mb,16, 4, tab_reg);
    QString tmp="";
    for(int r=0; r<4; r++) {
        char l = (tab_reg[r] & 0x00ff);
        char h = (tab_reg[r] & 0xff00) >> 8;
        tmp += l;
        tmp += h;
    }
    _viewer->rootContext()->setContextProperty("fileName", tmp);

}

void LaserModel::callGetFilesList()
{
    QStringList fileList;
     _viewer->rootContext()->setContextProperty("cutModel", QVariant::fromValue(fileList));
    QTimer::singleShot(10, this, SLOT(getFilesList()));
}


void LaserModel::getFilesList()
{
   int fileCount;
   int corrente;
   uint16_t tab_reg[64];
   uint8_t bit[10];
   QStringList fileList;

#ifdef NO_USB_ADAPTER
   fileList.append("File1");
   fileList.append("File2");
   fileList.append("File3");
   fileList.append("File4");
   fileList.append("File5");
   fileList.append("File6");
#else
   int r = modbus_read_registers(mb,14,2, tab_reg);

   fileCount = tab_reg[0];
   corrente = tab_reg[1];

   qDebug() << "Elenco file - count" << tab_reg[0] << "current" << tab_reg[1];

   QString prevTmp="";
   corrente = 10;

   while(corrente > 1) {
       modbus_write_bit(mb,31, 1);
       QThread::msleep(10);
       modbus_write_bit(mb,31, 0);
       QThread::msleep(10);

       corrente--;
       qDebug() << "rewind" << corrente;

   }

   QThread::msleep(500);
   bool leggoFile = true;
   while(leggoFile) {
       modbus_read_registers(mb,16, 4, tab_reg);
       QString tmp="";
       for(int r=0; r<4; r++) {
           char l = (tab_reg[r] & 0x00ff);
           char h = (tab_reg[r] & 0xff00) >> 8;
           tmp += l;
           tmp += h;
       }
       qDebug() << "name" << tmp;

       if((tmp.at(0) > 127) || (tmp.at(0) < 30)) {
          leggoFile = false;
       } else

       if(prevTmp != tmp) {
           fileList.append(tmp);

           modbus_write_bit(mb,30, 1);
           QThread::msleep(10);
           modbus_write_bit(mb,30, 0);
           QThread::msleep(10);
           prevTmp = tmp;
       } else {
           leggoFile = false;
       }
   }
#endif
   qDebug() << "File list" << fileList;
   _viewer->rootContext()->setContextProperty("cutModel", QVariant::fromValue(fileList));
   guiState("Choose");

}

void LaserModel::getUsbList(int number)
{
    qDebug() << "getUSBList" << number;

    int regCount= 0xff01;
    uint16_t tab_reg[64];
    QStringList fileList;

    for(int x=0; x < number; x++) {
        modbus_read_registers(mb,regCount+x, 4, tab_reg);
        QString tmp="";
        for(int r=0; r<4; r++) {
            char l = (tab_reg[r] & 0x00ff);
            char h = (tab_reg[r] & 0xff00) >> 8;
            if(l==8) l = ' ';
            if(h==8) h = ' ';
            tmp += l;
            tmp += h;
        }
        fileList.append(tmp);
    }
    _viewer->rootContext()->setContextProperty("usbFileModel", QVariant::fromValue(fileList));
}

void LaserModel::deleteFile()
{
    emit mbSignalWriteBit(29, 1);
    QThread::msleep(1);
    emit mbSignalWriteBit(29, 0);
    QThread::msleep(1);

    printCurrentFile();
    getFilesList();
}

void LaserModel::setFile(int num)
{
    qDebug() << "set file ------------------------------" << num;

    uint16_t tab_reg[64];

    modbus_read_registers(mb,14,2, tab_reg);
    int corrente = tab_reg[1];

    while(corrente != num) {
        if(corrente > num) {
            modbus_write_bit(mb,31, 1);
            QThread::msleep(10);
            modbus_write_bit(mb,31, 0);
            QThread::msleep(10);
        }
        if(corrente < num) {
            modbus_write_bit(mb,30, 1);
            QThread::msleep(10);
            modbus_write_bit(mb,30, 0);
            QThread::msleep(10);
        }
        modbus_read_registers(mb,14,2, tab_reg);
        corrente = tab_reg[1];
    }
}

void LaserModel::setName(int idx,QString name)
{
    _userlist->setName(idx, name);
}

void LaserModel::setPwd(int idx, QString pwd)
{
    _userlist->setPwd(idx, pwd);
}

void LaserModel::setLevel(int idx, int level)
{
    _userlist->setLevel(idx, level);
}

void LaserModel::setClearWater()
{
//    _led.setLed(SPIA_ACQUA, OFF);
}

void LaserModel::setClearGuide()
{
//    _led.setLed(SPIA_PULIRE_GUIDE, OFF);
}

void LaserModel::setClearFilter()
{
//    _led.setLed(SPIA_FILTRO, OFF);
}

void LaserModel::setAlarmOff(int sts)
{
//    if(sts)
//        _led.setLed(SPIA_SICUREZZE_OFF, ON);
//    else
//        _led.setLed(SPIA_SICUREZZE_OFF, OFF);
    _alarmUnsafe = sts;
}

void LaserModel::setStatus(QString sts)
{
    qDebug() << "setStatus()" << sts;

    _status = sts;
}

void LaserModel::uploadFile(int idFile)
{
    if(idFile != 255) idFile+=2;
    modbus_write_register(mb, 0x22, idFile);
}

void LaserModel::stopTimerLaser()
{
    _timerLaserFlag = false;
}

void LaserModel::mbSlotWriteBit(int reg, int sts)
{
    modbus_write_bit(mb, reg, sts);
}

void LaserModel::doRefreshUser()
{
//    qDebug() << "Refresh";
    _viewer->rootContext()->setContextProperty("usersModel", QVariant::fromValue(_userlist->userlist()));

}

void LaserModel::doComplete()
{
    qDebug()<<"doComplete"<<isStarted;
   /* if ( !isStarted )
    {
        return;
    }*/


    qDebug()<<"doComplete";
    if(_error->testAlarm(_alarmUnsafe) > 0){
         emit enableButton(0);

    } else {
        emit enableButton(1);

    }

    if(_timerLaserFlag) {
        uint16_t tab_reg[25];



        modbus_read_registers(mb,28,3, tab_reg);



        QString tempo = QString("%1:%2:%3").arg(tab_reg[0]).arg(tab_reg[1], 2, 10, QChar('0')).arg(tab_reg[2], 2, 10, QChar('0'));
         _viewer->rootContext()->setContextProperty("txtTime", tempo);

        modbus_read_registers(mb, 31, 2, tab_reg);



       // qDebug() << "-------------------------------------doComplete" << tab_reg[0] << tab_reg[1];


        if((tab_reg[0] & 0x40) == 0x40) {
            // usb in
            #ifdef QT_DEBUG
            #else
            if(_countUsb > 2) {
                qDebug() << "---------------------------------------Ho visto una USB";

                int Lo = tab_reg[1] & 0x00FF;
                int Hi = (tab_reg[1] & 0xFF00) >> 8;

                if(Lo == 0) {

                    if(_prevUsbFile != Hi) {
                        _prevUsbFile = Hi;
                        getUsbList(Hi);
                    }
                }

                if(!_menu_usb) {
                    _menu_usb = true;
                    // gui in file upload
                    guiState("FileUpload");
                }
            } else {
                _countUsb++;
            }
            #endif
        } else if((tab_reg[0] & 0x40) == 0x00) {
            // usb non presente
            if(_menu_usb) {
                _menu_usb = false;
                // gui in file
                guiState("File");
            }
             _lamp_usb = false;
            _countUsb=0;
        }

       if((tab_reg[0] & 0x02) == 0x02) {
            guiState("StopResume");
            isStarted = true;

        } else if((tab_reg[0] & 0x02) == 0x00) {
            if(isStarted) {
                isStarted=false;
                guiState("File");
            }

        }

    }

}

void LaserModel::showAlarm()
{
    Error* er = _error->getNextError();
    if(er->active()) {
        if(er->blocco()>0 && !_alarmUnsafe) {
            pause();
        }
        _viewer->rootContext()->setContextProperty("alImage", "../../images/"+er->img());
        _viewer->rootContext()->setContextProperty("alMessage", er->msg());
        _viewer->rootContext()->setContextProperty("closeAlarm", ((er->blocco()<2) || _alarmUnsafe));
        _viewer->rootContext()->setContextProperty("typeAlarm", er->color());
    } else {

        if(!_status.isEmpty()) {
            guiState(_status);
        }
    }
}

void LaserModel::setAmb(double t)
{
    _viewer->rootContext()->setContextProperty("txtAmb", t);
    _viewer->rootContext()->setContextProperty("setPointTAmb", t);
}

void LaserModel::setAcq(double t)
{
    _viewer->rootContext()->setContextProperty("txtAcq", t);
    _viewer->rootContext()->setContextProperty("setPointTAcqua", t);
}

void LaserModel::setHum(double t)
{
    _viewer->rootContext()->setContextProperty("txtHum", t);
    _viewer->rootContext()->setContextProperty("setPointH", t);
}

void LaserModel::setPres(double p)
{
    qDebug() << "---------------Pres" << p;
    _viewer->rootContext()->setContextProperty("setPointPset", p);
}

void LaserModel::setRealPres(double p)
{
    _viewer->rootContext()->setContextProperty("txtAir", p);
    _viewer->rootContext()->setContextProperty("setPointP", p);
}

void LaserModel::alarm(QString led)
{
    qDebug() << "Alarm";
//    _led.setLed(led,ON);

    showAlarm();

    guiState("Alarm");
}

void LaserModel::noalarm(QString led)
{
    qDebug() << "no" << _status;
//    _led.setLed(led,OFF);
    showAlarm();
}

void LaserModel::setLed(QString led)
{
//    _led.setLed(led,ON);
}

void LaserModel::resetLed(QString led)
{
//    _led.setLed(led,OFF);
}

void LaserModel::ackAlarm()
{
    _error->ackError();
    showAlarm();
}

void LaserModel::updateLan()
{
    QString ipEthAddr = "";
    QString ipWlanAddr = "";
    QList<QNetworkInterface> list = QNetworkInterface::allInterfaces(); // now you have interfaces list
    foreach (QNetworkInterface iface, list)  // this should print all interfaces' names
    {
        QList<QNetworkAddressEntry> adEntry = iface.addressEntries();
        foreach (const QNetworkAddressEntry &address, adEntry) {
            QHostAddress ha = address.ip();
            if (ha.protocol() == QAbstractSocket::IPv4Protocol && ha != QHostAddress(QHostAddress::LocalHost)){
                if(iface.name() == "eth0")
                    ipEthAddr += ha.toString();
                if(iface.name() == "wlan0")
                    ipWlanAddr += ha.toString();
            }
        }

    }

//    if(!ipEthAddr.isEmpty())
//        _led.setLed(SPIA_ETHERNET, ON);
//    else
//        _led.setLed(SPIA_ETHERNET, OFF);

//    if(!ipWlanAddr.isEmpty())
//        _led.setLed(SPIA_WIFI, ON);
//    else
//        _led.setLed(SPIA_WIFI, OFF);

    _viewer->rootContext()->setContextProperty("ipAddress", "Eth:" + ipEthAddr + "\n Wlan:" + ipWlanAddr);

}

