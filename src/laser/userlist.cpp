#include "userlist.h"
#include <QDebug>
#include <QFile>
#include <QStringList>

UserList::UserList(QObject *parent) : QObject(parent)
{

}

UserList::~UserList()
{

}

void UserList::load()
{
#ifdef QT_DEBUG
    QFile file("data/users.txt");
#else
    QFile file("/root/laser/data/users.txt");
#endif
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {

        while (!file.atEnd()) {
            QString line = file.readLine();
            QStringList sl = line.split(',');
            if(sl.count() == 4) {
                User *user = new User(sl[1].trimmed(), sl[2].toInt(), sl[3].trimmed(), sl[0].trimmed());
                connect(user, SIGNAL(nameChanged()), this, SLOT(save()));
                connect(user, SIGNAL(passwordChanged()), this, SLOT(save()));
                connect(user, SIGNAL(levelChanged()), this, SLOT(save()));
                connect(user, SIGNAL(timeChanged()), this, SLOT(save()));
                dataList.append(user);

                qDebug() << user->name();
            }
        }
    } else {
        qDebug() << "Errore file user";
    }
    file.close();

}

void UserList::save()
{
#ifdef QT_DEBUG
    QFile file("/data/users.txt");
#else
    QFile file("/root/laser/data/users.txt");
#endif
    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        for(int i=0; i< dataList.count(); i++) {
            User* u = (User*)dataList.at(i);
            QStringList sl;
            sl.append(u->password());
            sl.append(u->name());
            sl.append(QString::number(u->level()));
            sl.append(u->time());
            QString line = sl.join(",")+"\n";
            QByteArray ba = line.toLatin1();
            file.write(ba);
        }
    }
    file.close();
    emit listChanged();
}

bool UserList::contains(QString codice)
{
    bool found = false;
    for(int i=0; i< dataList.count(); i++) {
        User* u = (User*)dataList.at(i);
        if(u->password() == codice)
            found = true;
    }
    return found;
}

User *UserList::value(QString codice)
{
    for(int i=0; i< dataList.count(); i++) {
        User* u = (User*)dataList.at(i);
        if(u->password() == codice)
            return u;
    }
    return new User();
}

void UserList::add()
{
    User *user = new User("USER", 1, "00:00", "0000");
    connect(user, SIGNAL(nameChanged()), this, SLOT(save()));
    connect(user, SIGNAL(passwordChanged()), this, SLOT(save()));
    connect(user, SIGNAL(levelChanged()), this, SLOT(save()));
    connect(user, SIGNAL(timeChanged()), this, SLOT(save()));
    dataList.append(user);
    save();
}

void UserList::remove(int idx)
{
    User* u = (User*)dataList.at(idx);
    delete u;
    dataList.removeAt(idx);
    save();
}

void UserList::setName(int idx, QString name)
{
    User* u = (User*)dataList.at(idx);
    u->name(name);
}

void UserList::setPwd(int idx, QString pwd)
{
    User* u = (User*)dataList.at(idx);
    u->password(pwd);
}



