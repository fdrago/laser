#include "errorlist.h"

#include "ledtype.h"

#include <QDebug>
#include <QElapsedTimer>
#include <QFile>
#include <QStringList>
//0                1                         2                    3   4 5 6 7
//8,spia_umidita.png,            Umidita' alta,                   1, 60,+,0,TG

#define CHECK_END_FILE "____END_OF_ERRORS____DO_NOT_MODIFY_THIS_LINE\n"

ErrorList::ErrorList(QObject *parent) : QObject(parent)
{
    int fileOk = loadFile();
    if ( fileOk<0 )
    {
        loadFile();
    }

    _serial = new QextSerialPort("COM1");
    connect(_serial, SIGNAL(readyRead()), this, SLOT(readData()));

#ifdef QT_DEBUG
    _serial->setPortName("/dev/ttyUSB0");
#else
    _serial->setPortName("/dev/ttyS1");
#endif
    if (_serial->open(QIODevice::ReadWrite)) {
        qDebug() << "Serial io ok";
    } else {
        qDebug() << "Serial io FAIL" << _serial->lastError() <<  _serial->errorString();;
    }
    _serial->setBaudRate(BAUD19200); //19200

    _pressure_required = 1;
    QByteArray dato= QString("P%1\n").arg(((_pressure_required)*255/7/2),3,10,QChar('0')).toLatin1();
    _serial->write(dato);
    emit setPres(_pressure_required * 0.7);

    _req = false;
}

ErrorList::~ErrorList()
{

}

void ErrorList::request()
{
    qDebug() << "Request";
    if(_req)
        _serial->write("I\n");
    else
        _serial->write("A\n");

    _req = !_req;

    cmdComplete = false;

}

void ErrorList::readData()
{

    // leggo il tempo
    //QElapsedTimer timer;
    //timer.start();
//qDebug() << "The slow operation took" << timer.elapsed() << "milliseconds";

    int numBytes = _serial->bytesAvailable();

    if(numBytes==0) return;

    bool loop = true;
    while(loop) {

        QByteArray data = _serial->read(1);

        numBytes--;

        if(data.at(0) == 0x0d)
        {
            cmdComplete = true;
            //qDebug() << "0d";
        }

        else if(data.at(0) == 0x0a)
        {
            cmdComplete = true;
            //qDebug() << "0a";
        }

        else
            _cmd.append(data);

        if(numBytes==0)
            loop=false;

        if(cmdComplete) {
            if(!_cmd.isEmpty()) {

                if(_cmd.startsWith("ko")) {
                  qDebug() << "Errore";
                } /*else if(_cmd.startsWith("A")) {
                    qDebug() << _cmd;
                    _cmd = _cmd.mid(1);
                    bool ok;
                    int p = _cmd.toInt(&ok, 16);

                    double rp = p*0.017 - 2.625;

                    qDebug() << "CALCOLO PRESSIONE---------" << p << rp;

                    emit setRealPres(rp);

                    double sp = _pressure_required * 0.7;

                    if((sp==0) || (rp < (sp * 0.9) ) || (rp > (sp * 1.1))) {
                        emit setLed(SPIA_ARIA);
                    } else {
                        emit resetLed(SPIA_ARIA);
                    }


                }*/ else if(_cmd.startsWith("ok")) {
                    if(_cmd.length() > 3) {
                        _cmd = _cmd.mid(4);
                        qDebug() << _cmd;

                        QStringList sl = _cmd.split(",");
                        if(sl.count() == 4) {

                            // sl[0] = IO
                            // 0 - sportello 1
                            test(QString(sl[0].at(0)).toFloat(), 0);

                            // 1 - sportello 2
                            test(QString(sl[0].at(1)).toFloat(), 1);

                            // 2 - sportello 3
                            test(QString(sl[0].at(2)).toFloat(), 2);

                            // 3 - filtro pieno
                            test(QString(sl[0].at(3)).toFloat(), 3);

                            // 4 - valvola
                            test(QString(sl[0].at(4)).toFloat(), 4);

                            // 5

                            // 6

                            // 8 - fiamma
                            test(QString(sl[0].at(8)).toFloat(), 5);



                            // 6 - sl[1] = temp acqua
                            test(sl[1].toFloat(), 6);
                            emit setAcq(sl[1].toDouble());

                            // 7 - sl[2] = temp aria
                            test(sl[2].toFloat(), 7);
                            emit setAmb(sl[2].toDouble());

                            // 8 - sl[3] = umid
                            test(sl[3].toFloat(), 8);
                            emit setHum(sl[3].toDouble());


                        }


                        else if(sl.count() == 1) {
                            //_cmd = _cmd.mid(3);

                            bool ok;
                            int p = _cmd.toInt(&ok, 16);

                            //qDebug() << "cmd.mid" << p;

                            double rp = (p-102.5)*10/(512-102);

                            //qDebug() << "CALCOLO PRESSIONE---------" << p << " -> " << rp;

                            emit setRealPres(rp);

                            double sp = _pressure_required * 0.7;

                            if((sp==0) || (rp < (sp * 0.9) ) || (rp > (sp * 1.1))) {
                                emit setLed(SPIA_ARIA);
                            } else {
                                emit resetLed(SPIA_ARIA);
                            }
                        }


                        else {
                            qDebug() << "Errore numero elementi";
                        }
                    }
                }
            }
            _cmd = "";
        }
    }



}


void ErrorList::setFan(int sts)
{
    QByteArray dato= QString("O1%1\n").arg(sts).toLatin1();
    //qDebug() << dato;
    _serial->write(dato);
}

void ErrorList::setLaser(int sts)
{
    QByteArray dato= QString("O2%1\n").arg(sts).toLatin1();
    //qDebug() << dato;
    _serial->write(dato);
}

void ErrorList::setLight(int sts)
{
    QByteArray dato= QString("O3%1\n").arg(sts).toLatin1();
    //qDebug() << dato;
    _serial->write(dato);
}

void ErrorList::incPres()
{
    if(_pressure_required < 7) _pressure_required++;
    QByteArray dato= QString("P%1\n").arg(((_pressure_required)*255/7/2),3,10,QChar('0')).toLatin1();
    //qDebug()<<dato;
    _serial->write(dato);

    emit setPres(_pressure_required * 0.7);
}

void ErrorList::decPres()
{
    if(_pressure_required > 0) _pressure_required--;
    QByteArray dato= QString("P%1\n").arg(((_pressure_required)*255/7/2),3,10,QChar('0')).toLatin1();
    //qDebug()<<dato;
    _serial->write(dato);

    emit setPres(_pressure_required * 0.7);
}

void ErrorList::save()
{
    QString res;

    for(int i=0; i < _list.count(); i++)
    {
        Error *error = (Error*)_list.at(i);
        QStringList line;
        line.append( QString::number( error->id()   ).leftJustified(4, ' ')    );
        line.append( error->img().leftJustified(30, ' ')     );
        line.append( error->msg().leftJustified(30, ' ')     );
        line.append( QString::number( error->blocco() ).leftJustified(5, ' ') );
        line.append( QString::number( (int)error->limit() ).leftJustified(5, ' ')  );
        line.append(  error->verso().leftJustified(5, ' ') );
        line.append( QString::number( error->color() ).leftJustified(5, ' ')   );
        res.append( line.join(",") );
        res.append( "\n" );
    }

#ifdef QT_DEBUG
    QFile file("data/error.txt");
#else
    QFile file("/root/qtapp/data/error.txt");
#endif

    if ( !file.open(QFile::WriteOnly | QFile::Truncate))
    {
        qDebug() << "Failed to save error file";
        return;
    }

    if ( file.write( res.toLatin1() ) != res.size() )
    {
        qDebug() << "Failed to write error file";
        return;
    }

    file.write(CHECK_END_FILE);

    file.close();

}

void ErrorList::test(float x, int idx)
{
    for(int i=0; i < _list.count(); i++) {
        Error * er = (Error*)_list.at(i);
        if(er->id() == idx) {
            //qDebug() << "Ok";
            int ret = er->status(x);
            if(ret==1) {
                // attivare la spia
                //emit alarm(er->id());
            } else if(ret==-1) {
                // disattivare la spia
                //emit noalarm(er->led());
            }
        }
    }

}

Error *ErrorList::getNextError()
{
//    qDebug() << _list.count();

    for(int i=0; i < _list.count(); i++) {
        if(_prevAlarm == _list.count()-1) {
            _prevAlarm = -1;
        }
        _prevAlarm++;
        Error * er = (Error*)_list.at(_prevAlarm);

//        qDebug() << _prevAlarm << er->msg() << er->active();

        if(er->active() && !er->ack()){
            return er;
        }
    }

//    qDebug() << "fine";

    return new Error();
}

Error *ErrorList::getErrorById(int id)
{
    for(int i=0; i < _list.count(); i++)
    {
        Error * er = (Error*)_list.at(i);

        if( er->id() == id)
            return er;
    }
    return NULL;
}

void ErrorList::ackError()
{
    Error * er = (Error*)_list.at(_prevAlarm);
    er->ack(true);
}

int ErrorList::testAlarm(bool isUnsafe)
{
    int sum =0;
    for(int i=0; i < _list.count(); i++) {
         Error * er = (Error*)_list.at(i);

        if(er->active()){
            sum += er->blocco();

        }
    }
    if((sum==0) || isUnsafe)
        setAlim(1);
    else
        setAlim(0);
    return sum;
}

void ErrorList::setSemaphore(int sts)
{
    QByteArray dato= QString("O4%1\n").arg(sts).toLatin1();
    //qDebug() << dato;
    _serial->write(dato);
}

void ErrorList::setAlim(int sts)
{
    QByteArray dato= QString("O5%1\n").arg(sts).toLatin1();
    //qDebug() << dato;
    _serial->write(dato);
}

int ErrorList::loadFile()
{
#ifdef QT_DEBUG
    QFile file("data/error.txt");
#else
    QFile file("/root/qtapp/data/error.txt");
#endif

    bool filechecked = false;

    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {

        while (!file.atEnd()) {
            QString line = file.readLine();
            if ( line == CHECK_END_FILE )
            {
                filechecked = true;
                continue;
            }
            QStringList sl = line.split(',');
//            if(sl.count() == 7) {
                Error *error = new Error();

                error->id(sl[0].toInt());
                error->img(sl[1].trimmed());
                error->msg(sl[2].trimmed());
                error->blocco(sl[3].toInt());
                error->limit(sl[4].toFloat());
                error->verso(sl[5].trimmed());
                error->color(sl[6].toInt());
                //error->led(sl[7].trimmed());

                _list.append(error);

//                qDebug() << sl;
//            } else {
//                qDebug() << "errore num elementi" << line;
//            }

        }
    } else {
        qDebug() << "Errore file errori";
        return -1;
    }
    file.close();

    if ( !filechecked )
    {
        file.remove();

#ifdef QT_DEBUG
        QFile origfile("data/error_orig.txt");
        origfile.copy("data/error.txt");
#else
        QFile origfile("/root/qtapp/data/error_orig.txt");
        origfile.copy("/root/qtapp/data/error.txt");
#endif
        return -2;
    }
    return 0;


}

Error::Error()
{

}

Error::~Error()
{

}

int Error::status(float sts)
{
    int ret=0;
    if(!_active) {
        if(_verso=="+"){
            if(sts > _limit) {
                _active = true;
                ret = 1;
            }
        } else {
            if(sts < _limit) {
                _active = true;
                ret = 1;
            }
        }
    } else {
        if(_verso=="+"){
            float tlimit = _limit;
            if(tlimit > 1) tlimit = tlimit * 0.95;
            if(sts <= tlimit) {
                _active = false;
                _ack = false;
                ret = -1;
            }
        } else {
            float tlimit = _limit;
            if(tlimit > 1) tlimit = tlimit * 1.05;
            if(sts >= tlimit) {
                _active = false;
                _ack = false;
                ret = -1;
            }
        }
    }
    return ret;
}

