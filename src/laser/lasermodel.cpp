#include "lasermodel.h"
#include "errorlist.h"
#include "paramlist.h"
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

    _paramlist = new ParamList;
    _paramlist->load();

    _logger = new Logger(this);
    _logger->load();

    _error = new ErrorList;
    _error->pressureRequired(getParamVal(6));
    qDebug()<<"Pressure required: "<<getParamVal(6);

    _menu_usb = false;
    _countUsb = 0;

    /*timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(updateLan()));
    timer->start(10000);*/

    connect(this, SIGNAL(mbSignalWriteBit(int,int)), this, SLOT(mbSlotWriteBit(int,int)));
    connect(_userlist, SIGNAL(listChanged()), this, SLOT(doRefreshUser()));
    connect(_error, SIGNAL(setAcq(double)), this, SLOT(setAcq(double)));
    connect(_error, SIGNAL(setAmb(double)), this, SLOT(setAmb(double)));
    connect(_error, SIGNAL(setHum(double)), this, SLOT(setHum(double)));
    connect(_error, SIGNAL(setPres(double)), this, SLOT(setPres(double)));
    connect(_error, SIGNAL(setRealPres(double)), this, SLOT(setRealPres(double)));
    connect(_error, SIGNAL(alarm(QString)), this, SLOT(alarm(QString)));
    connect(_error, SIGNAL(noalarm(QString)), this, SLOT(noalarm(QString)));
}

void LaserModel::setViewer(QtQuick1ApplicationViewer *viewer)
{
    qDebug() << "ver 1.6";
    _viewer = viewer;
    _timer = new QTimer(this);
    connect(_timer, SIGNAL(timeout()), _error, SLOT(request()));
    _timerLaser = new QTimer(this);
    connect(_timerLaser, SIGNAL(timeout()), this, SLOT(doComplete()));
    _timerAlarm = new QTimer(this);
    connect(_timerAlarm, SIGNAL(timeout()), this, SLOT(showAlarm()));

#ifdef QT_DEBUG
    mb = modbus_new_rtu("/dev/ttyUSB1",9600,'N',8,1);
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

    QStringList fileList;
    _viewer->rootContext()->setContextProperty("usbFileModel", QVariant::fromValue(fileList));
    _viewer->rootContext()->setContextProperty("userList", _userlist);
    _viewer->rootContext()->setContextProperty("usersModel", QVariant::fromValue(_userlist->userlist()));

    log("Startup");

    setFan(1);
    setLight(1);
    setLaser(1);
    getFilesList();
    printCurrentFile();
    setAcq(0.0);
    setAmb(0.0);
    setHum(0);
    if(getParamVal(6)==-1){
        setPres(7);
    }
    else{
        setPres(getParamVal(6)*0.7);
    }

//    _timerLaserFlag = false;
    _timer->start(500);
    _timerLaser->start(500);
    _timerAlarm->start(500);

}

void LaserModel::setDate(const int yy, const int MM, const int dd, const int hh, const int mm)
{
     QStringList l;
     l.append("-s");
     l.append(QString("%1").arg(yy+2000, 2, 10, QChar('0'))+"-"+QString("%1").arg(MM, 2, 10, QChar('0'))+"-"+QString("%1").arg(dd, 2, 10, QChar('0'))+"-"+QString("%1").arg(hh, 2, 10, QChar('0'))+":"+QString("%1").arg(mm, 2, 10, QChar('0'))+":"+"00");
     QProcess::execute("date", l);
     QStringList ll;
     ll.append("-w");
     QProcess::execute("hwclock", ll);
     log("Date changed to: " + l[1]);
}

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
}

void LaserModel::moveXminus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 5, 1);
}

void LaserModel::moveYplus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 7, 1);
}

void LaserModel::moveYminus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 6, 1);
}

void LaserModel::moveZplus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit(20, 1);
}

void LaserModel::moveZminus()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit(21, 1);
}

void LaserModel::start()
{
    qDebug() << __FUNCTION__;
    emit mbSignalWriteBit( 0, 1);
//    _timerLaserFlag = true;
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
    emit mbSignalWriteBit(19, 1);
    QThread::msleep(500);
    emit mbSignalWriteBit(19, 0);
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
    setParamVal(6,_error->incPres());
}

void LaserModel::decPres()
{
    setParamVal(6,_error->decPres());
}

void LaserModel::login(QString codice)
{

    if(codice == "guest"){
        _viewer->rootContext()->setContextProperty("username", "Guest");
        _viewer->rootContext()->setContextProperty("userlevel", 1);
        emit stateChanged("File");
    }
    else if(_userlist->contains(codice)) {
        _currentUser = _userlist->value(codice);
        _viewer->rootContext()->setContextProperty("username", _currentUser->name());
        qDebug() << _currentUser->level();
        _viewer->rootContext()->setContextProperty("userlevel", _currentUser->level());
        emit stateChanged("File");
        log( "Login "+  _currentUser->name());
    } else {
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
    log("Water Cleared");
}

void LaserModel::setClearGuide()
{
    log("Guides Cleared");
}

void LaserModel::setClearFilter()
{
    log("Filter Cleared");
}

void LaserModel::setAlarmOff(int sts)
{
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

/*void LaserModel::stopTimerLaser()
{
    _timerLaserFlag = false;
}*/

void LaserModel::log(QString s)
{
    _logger->log(s) ;
    QStringList logs = _logger->logs();
    _viewer->rootContext()->setContextProperty("modelLogs", QVariant::fromValue( logs ) );
}

void LaserModel::mbSlotWriteBit(int reg, int sts)
{
    modbus_write_bit(mb, reg, sts);
}

void LaserModel::doRefreshUser()
{
    _viewer->rootContext()->setContextProperty("usersModel", QVariant::fromValue(_userlist->userlist()));
}

void LaserModel::doComplete()
{
    qDebug()<<"---doComplete---------------------";
    if(_error->testAlarm(_alarmUnsafe) > 0){
        emit enableButton(0);
    } else {
        emit enableButton(1);
    }
    //if(_timerLaserFlag) {
    if(1){
        uint16_t tab_reg[25];

        modbus_read_registers(mb,28,3, tab_reg);

        long tempoLong = tab_reg[0]*3600+tab_reg[1]*60+tab_reg[2];

        if (tempoLong >0 && tempoLong!=_tempoSecondi){
            _tempoSecondi = tempoLong;
            qDebug()<<"Timer: "<<_tempoSecondi;
        }

        QString ciao = "ciao";

        QString tempo = QString("%1:%2:%3").arg(tab_reg[0]).arg(tab_reg[1], 2, 10, QChar('0')).arg(tab_reg[2], 2, 10, QChar('0'));
         _viewer->rootContext()->setContextProperty("txtTime", tempo);

        modbus_read_registers(mb, 31, 2, tab_reg);

        if((tab_reg[0] & 0x40) == 0x40) {
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
                    guiState("FileUpload");
                }
            } else {
                _countUsb++;
            }
            #endif
        } else if((tab_reg[0] & 0x40) == 0x00) {
            if(_menu_usb) {
                _menu_usb = false;
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
                setParamVal(1, getParamVal(1)+_tempoSecondi);
                _tempoSecondi=0;
                //_timerLaserFlag = false;
            }

        }

    }

}

void LaserModel::showAlarm()
{
    Error* er = _error->getNextError();

    if( er->active() ) {

        qDebug()<<er->msg();


        if(er->blocco()>0 && !_alarmUnsafe) {
            pause();
        }

        qDebug()<<"current: "<<_currentError;

            _viewer->rootContext()->setContextProperty("alImage", "../../images/"+er->img());
            _viewer->rootContext()->setContextProperty("alMessage", er->msg());
            _viewer->rootContext()->setContextProperty("closeAlarm", ((er->blocco()<2) || _alarmUnsafe));
            _viewer->rootContext()->setContextProperty("typeAlarm", er->color());
            _currentError = er;

        emit allarme( er->id(), true) ;


        if( er->ackStatus() == false){
            guiState("Alarm");
        }






    } else {

        if( !_status.isEmpty() && _status!="Alarm") {
            guiState(_status);
        }
        else if(_status=="Alarm"){
            guiState("main");
        }

        emit allarme( er->id(), false) ;

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
    log( QString("Pressure set: %1").arg(p));
    _viewer->rootContext()->setContextProperty("setPointPset", p);
}

void LaserModel::setRealPres(double p)
{
    _viewer->rootContext()->setContextProperty("txtAir", p);
    _viewer->rootContext()->setContextProperty("setPointP", p);
}

void LaserModel::ackAlarm()
{
    _error->ackError();

    if(_viewer->rootContext()->contextProperty("username")=="ADMIN"){
        login("guest");
    }
    else{
        guiState("File");
    }

    _currentError = NULL;
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

    _viewer->rootContext()->setContextProperty("ipAddress", "Eth:" + ipEthAddr + "\n Wlan:" + ipWlanAddr);

}

bool LaserModel::getErrNONC(int id)
{
    Error* er = _error->getErrorById( id );
    if (!er)
        return false;

    if ( er->verso() == "+")
    return true;
    else
    return false;

}

QString LaserModel::getErrVal(int id)
{
    Error* er = _error->getErrorById( id );
    if (!er)
        return 0;

    return QString::number(er->limit());
}

QString LaserModel::getErrString(int id)
{
    Error* er = _error->getErrorById( id );
    if (!er)
        return "";

    return er->msg();
}

void LaserModel::setErrNONC(int id, bool val)
{
    Error* er = _error->getErrorById( id );
    if (!er)
        return;

    er->verso( val==1 ? "+" : "-");
    qDebug()<<"id "<< id << "changed to: " << er->verso();
    _error->save();   
}

void LaserModel::setErrVal(int id, float val)
{
    Error* er = _error->getErrorById( id );
    if (!er)
        return;
    if (val>255) val=255;
    if (val<-255) val=-255;

    er->limit( val );
    _error->save();
    qDebug()<<"Value set to "<<val;

}

int LaserModel::getParamVal(int id){
    return _paramlist->ParamValFromId(id);
}

QString LaserModel::getParamName(int id){
    return _paramlist->ParamNameFromId(id);
}

void LaserModel::setParamVal(int id, float val){
    int maxval=1024;
    int minval=-1;
    Parameter* par= _paramlist->ParamFromId(id);
    if (val<minval) val=minval;
    if (val>maxval) val=maxval;
    par->value(val);
    _paramlist->save();
}

