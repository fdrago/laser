#include "user.h"
#include <QStringList>
#include <QDebug>

User::User()
{

}

User::User(const QString &name, const int &level, const QString &time, const QString password)
{
    this->name(name);
    this->level(level);
    this->time(time);
    this->password(password);
}

User::~User()
{

}

int User::level() const
{
    return _level;
}

QString User::name() const
{
    return _username;
}

void User::time(QString time)
{
     QStringList sl = time.split(":");
     h = sl[0].toInt();
     m = sl[1].toInt();

     emit timeChanged();
}

QString User::time() const
{
    return QString("%1:%2").arg(h).arg(m, 2, 10, QLatin1Char('0'));
}

void User::addTime(QString nt)
{
    QStringList sl = nt.split(":");
    int _h = sl[0].toInt();
    int _m = sl[1].toInt();

    h += _h;
    m += _m;
    if(m > 59) {
        m -= 60;
        h++;
    }
    emit timeChanged();
}

QString User::password() const
{
    return _password;
}

