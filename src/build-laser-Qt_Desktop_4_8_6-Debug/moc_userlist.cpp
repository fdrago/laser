/****************************************************************************
** Meta object code from reading C++ file 'userlist.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../laser/userlist.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'userlist.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_UserList[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      10,    9,    9,    9, 0x05,

 // slots: signature, parameters, type, tag, flags
      24,    9,    9,    9, 0x0a,

 // methods: signature, parameters, type, tag, flags
      31,    9,    9,    9, 0x02,
      41,   37,    9,    9, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_UserList[] = {
    "UserList\0\0listChanged()\0save()\0add()\0"
    "idx\0remove(int)\0"
};

void UserList::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        UserList *_t = static_cast<UserList *>(_o);
        switch (_id) {
        case 0: _t->listChanged(); break;
        case 1: _t->save(); break;
        case 2: _t->add(); break;
        case 3: _t->remove((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData UserList::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject UserList::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_UserList,
      qt_meta_data_UserList, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &UserList::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *UserList::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *UserList::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_UserList))
        return static_cast<void*>(const_cast< UserList*>(this));
    return QObject::qt_metacast(_clname);
}

int UserList::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void UserList::listChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE
