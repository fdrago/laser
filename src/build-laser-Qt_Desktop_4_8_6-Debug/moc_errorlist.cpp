/****************************************************************************
** Meta object code from reading C++ file 'errorlist.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../laser/errorlist.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'errorlist.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Error[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_Error[] = {
    "Error\0"
};

void Error::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData Error::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Error::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Error,
      qt_meta_data_Error, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Error::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Error::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Error::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Error))
        return static_cast<void*>(const_cast< Error*>(this));
    return QObject::qt_metacast(_clname);
}

int Error::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ErrorList[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      18,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       9,       // signalCount

 // signals: signature, parameters, type, tag, flags
      13,   11,   10,   10, 0x05,
      28,   11,   10,   10, 0x05,
      43,   11,   10,   10, 0x05,
      60,   58,   10,   10, 0x05,
      76,   58,   10,   10, 0x05,
     100,   96,   10,   10, 0x05,
     115,   96,   10,   10, 0x05,
     132,   96,   10,   10, 0x05,
     148,   96,   10,   10, 0x05,

 // slots: signature, parameters, type, tag, flags
     166,   10,   10,   10, 0x0a,
     177,   10,   10,   10, 0x0a,
     191,  187,   10,   10, 0x0a,
     209,  187,   10,   10, 0x0a,

 // methods: signature, parameters, type, tag, flags
     222,  187,   10,   10, 0x02,
     234,  187,   10,   10, 0x02,
     248,  187,   10,   10, 0x02,
     262,   10,   10,   10, 0x02,
     272,   10,   10,   10, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_ErrorList[] = {
    "ErrorList\0\0t\0setAmb(double)\0setAcq(double)\0"
    "setHum(double)\0p\0setPres(double)\0"
    "setRealPres(double)\0led\0alarm(QString)\0"
    "noalarm(QString)\0setLed(QString)\0"
    "resetLed(QString)\0readData()\0request()\0"
    "sts\0setSemaphore(int)\0setAlim(int)\0"
    "setFan(int)\0setLaser(int)\0setLight(int)\0"
    "incPres()\0decPres()\0"
};

void ErrorList::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ErrorList *_t = static_cast<ErrorList *>(_o);
        switch (_id) {
        case 0: _t->setAmb((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 1: _t->setAcq((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 2: _t->setHum((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 3: _t->setPres((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 4: _t->setRealPres((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 5: _t->alarm((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: _t->noalarm((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 7: _t->setLed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: _t->resetLed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 9: _t->readData(); break;
        case 10: _t->request(); break;
        case 11: _t->setSemaphore((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 12: _t->setAlim((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 13: _t->setFan((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 14: _t->setLaser((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 15: _t->setLight((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 16: _t->incPres(); break;
        case 17: _t->decPres(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ErrorList::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ErrorList::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ErrorList,
      qt_meta_data_ErrorList, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ErrorList::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ErrorList::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ErrorList::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ErrorList))
        return static_cast<void*>(const_cast< ErrorList*>(this));
    return QObject::qt_metacast(_clname);
}

int ErrorList::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 18)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 18;
    }
    return _id;
}

// SIGNAL 0
void ErrorList::setAmb(double _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ErrorList::setAcq(double _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void ErrorList::setHum(double _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void ErrorList::setPres(double _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void ErrorList::setRealPres(double _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void ErrorList::alarm(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void ErrorList::noalarm(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}

// SIGNAL 7
void ErrorList::setLed(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 7, _a);
}

// SIGNAL 8
void ErrorList::resetLed(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 8, _a);
}
QT_END_MOC_NAMESPACE
