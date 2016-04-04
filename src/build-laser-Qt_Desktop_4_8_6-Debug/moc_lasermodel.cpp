/****************************************************************************
** Meta object code from reading C++ file 'lasermodel.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../laser/lasermodel.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'lasermodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_LaserModel[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      53,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: signature, parameters, type, tag, flags
      21,   12,   11,   11, 0x05,
      46,   43,   11,   11, 0x05,
      72,   64,   11,   11, 0x05,

 // slots: signature, parameters, type, tag, flags
      98,   64,   11,   11, 0x0a,
     122,   11,   11,   11, 0x0a,
     138,   11,   11,   11, 0x0a,
     151,   11,   11,   11, 0x0a,
     165,  163,   11,   11, 0x0a,
     180,  163,   11,   11, 0x0a,
     195,  163,   11,   11, 0x0a,
     212,  210,   11,   11, 0x0a,
     228,  210,   11,   11, 0x0a,
     252,  248,   11,   11, 0x0a,
     267,  248,   11,   11, 0x0a,
     284,  248,   11,   11, 0x0a,
     300,  248,   11,   11, 0x0a,
     318,   11,   11,   11, 0x0a,
     329,   11,   11,   11, 0x0a,

 // methods: signature, parameters, type, tag, flags
     341,   12,   11,   11, 0x02,
     359,   11,   11,   11, 0x02,
     370,   11,   11,   11, 0x02,
     382,   11,   11,   11, 0x02,
     395,   11,   11,   11, 0x02,
     407,   11,   11,   11, 0x02,
     420,   11,   11,   11, 0x02,
     432,   11,   11,   11, 0x02,
     445,   11,   11,   11, 0x02,
     453,   11,   11,   11, 0x02,
     460,   11,   11,   11, 0x02,
     468,   11,   11,   11, 0x02,
     477,   11,   11,   11, 0x02,
     485,   11,   11,   11, 0x02,
     492,   11,   11,   11, 0x02,
     509,  505,   11,   11, 0x02,
     521,  505,   11,   11, 0x02,
     535,  505,   11,   11, 0x02,
     549,   11,   11,   11, 0x02,
     559,   11,   11,   11, 0x02,
     576,  569,   11,   11, 0x02,
     591,   11,   11,   11, 0x02,
     610,   11,   11,   11, 0x02,
     632,  625,   11,   11, 0x02,
     648,   11,   11,   11, 0x02,
     665,  661,   11,   11, 0x02,
     687,  678,   11,   11, 0x02,
     716,  708,   11,   11, 0x02,
     736,   11,   11,   11, 0x02,
     752,   11,   11,   11, 0x02,
     768,   11,   11,   11, 0x02,
     785,  505,   11,   11, 0x02,
     802,  505,   11,   11, 0x02,
     828,  821,   11,   11, 0x02,
     844,   11,   11,   11, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_LaserModel[] = {
    "LaserModel\0\0newState\0stateChanged(QString)\0"
    "eb\0enableButton(int)\0reg,sts\0"
    "mbSignalWriteBit(int,int)\0"
    "mbSlotWriteBit(int,int)\0doRefreshUser()\0"
    "doComplete()\0showAlarm()\0t\0setAmb(double)\0"
    "setAcq(double)\0setHum(double)\0p\0"
    "setPres(double)\0setRealPres(double)\0"
    "led\0alarm(QString)\0noalarm(QString)\0"
    "setLed(QString)\0resetLed(QString)\0"
    "ackAlarm()\0updateLan()\0guiState(QString)\0"
    "moveStop()\0moveXplus()\0moveXminus()\0"
    "moveYplus()\0moveYminus()\0moveZplus()\0"
    "moveZminus()\0start()\0stop()\0pause()\0"
    "resume()\0shoot()\0test()\0cutContour()\0"
    "sts\0setFan(int)\0setLight(int)\0"
    "setLaser(int)\0incPres()\0decPres()\0"
    "codice\0login(QString)\0printCurrentFile()\0"
    "getFilesList()\0number\0getUsbList(int)\0"
    "deleteFile()\0num\0setFile(int)\0idx,name\0"
    "setName(int,QString)\0idx,pwd\0"
    "setPwd(int,QString)\0setClearWater()\0"
    "setClearGuide()\0setClearFilter()\0"
    "setAlarmOff(int)\0setStatus(QString)\0"
    "idFile\0uploadFile(int)\0stopTimerLaser()\0"
};

void LaserModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        LaserModel *_t = static_cast<LaserModel *>(_o);
        switch (_id) {
        case 0: _t->stateChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->enableButton((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 2: _t->mbSignalWriteBit((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 3: _t->mbSlotWriteBit((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 4: _t->doRefreshUser(); break;
        case 5: _t->doComplete(); break;
        case 6: _t->showAlarm(); break;
        case 7: _t->setAmb((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 8: _t->setAcq((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 9: _t->setHum((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 10: _t->setPres((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 11: _t->setRealPres((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 12: _t->alarm((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 13: _t->noalarm((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 14: _t->setLed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 15: _t->resetLed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 16: _t->ackAlarm(); break;
        case 17: _t->updateLan(); break;
        case 18: _t->guiState((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 19: _t->moveStop(); break;
        case 20: _t->moveXplus(); break;
        case 21: _t->moveXminus(); break;
        case 22: _t->moveYplus(); break;
        case 23: _t->moveYminus(); break;
        case 24: _t->moveZplus(); break;
        case 25: _t->moveZminus(); break;
        case 26: _t->start(); break;
        case 27: _t->stop(); break;
        case 28: _t->pause(); break;
        case 29: _t->resume(); break;
        case 30: _t->shoot(); break;
        case 31: _t->test(); break;
        case 32: _t->cutContour(); break;
        case 33: _t->setFan((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 34: _t->setLight((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 35: _t->setLaser((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 36: _t->incPres(); break;
        case 37: _t->decPres(); break;
        case 38: _t->login((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 39: _t->printCurrentFile(); break;
        case 40: _t->getFilesList(); break;
        case 41: _t->getUsbList((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 42: _t->deleteFile(); break;
        case 43: _t->setFile((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 44: _t->setName((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 45: _t->setPwd((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 46: _t->setClearWater(); break;
        case 47: _t->setClearGuide(); break;
        case 48: _t->setClearFilter(); break;
        case 49: _t->setAlarmOff((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 50: _t->setStatus((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 51: _t->uploadFile((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 52: _t->stopTimerLaser(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData LaserModel::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LaserModel::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_LaserModel,
      qt_meta_data_LaserModel, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LaserModel::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LaserModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LaserModel::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LaserModel))
        return static_cast<void*>(const_cast< LaserModel*>(this));
    return QObject::qt_metacast(_clname);
}

int LaserModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 53)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 53;
    }
    return _id;
}

// SIGNAL 0
void LaserModel::stateChanged(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void LaserModel::enableButton(const int & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void LaserModel::mbSignalWriteBit(int _t1, int _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_END_MOC_NAMESPACE
