#include "paramlist.h"
#include <QDebug>
#include <QFile>
#include <QStringList>



ParamList::ParamList(QObject *parent) : QObject(parent)
{

}

ParamList::~ParamList()
{

}

void ParamList::load()
{
#ifdef QT_DEBUG
    QFile file("data/parameters.txt");
#else
    QFile file("/root/qtapp/data/parameters.txt");
#endif
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {

        while (!file.atEnd()) {
            QString line = file.readLine();
            QStringList sl = line.split(':');
            if(sl.count() == 3) {
                Parameter *parameter = new Parameter(sl[0].toInt(),sl[1].trimmed(), sl[2].toInt());
                ParameterList.append(parameter);

                qDebug() << parameter->name() << parameter->value();
            }
        }
    } else {
        qDebug() << "Errore file parametri";
    }
    file.close();

}
/*
void UserList::save()
{
#ifdef QT_DEBUG
    QFile file("data/users.txt");
#else
    QFile file("/root/qtapp/data/users.txt");
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
}*/

/*bool ParamList::contains(QString codice)
{
    bool found = false;
    for(int i=0; i< dataList.count(); i++) {
        User* u = (User*)dataList.at(i);
        if(u->password() == codice)
            found = true;
    }
    return found;
}*/

int ParamList::ParamValFromName(QString ParamName)
{
    for(int i=0; i< ParameterList.count(); i++) {
        Parameter* u = (Parameter*)ParameterList.at(i);
        if(u->name() == ParamName)
            return u->value();
    }
    return 0;
}
/*
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

void UserList::setLevel(int idx, int level)
{
    User* u = (User*)dataList.at(idx);
    u->level(level);
}

*/

int ParamList::ParamValFromId(int id)
{
    Parameter* pa = (Parameter*)ParameterList.at(id);
    if (!pa)
        return 0;

    return pa->value();
}

QString ParamList::ParamNameFromId(int id)
{
    Parameter* pa = (Parameter*)ParameterList.at(id);
    if (!pa)
        return 0;

    return pa->name();
}

Parameter* ParamList::ParamFromId(int id)
{
    Parameter* pa = (Parameter*)ParameterList.at(id);
    return pa;
}

void ParamList::save()
{
    QString res;

    for(int i=0; i < ParameterList.count(); i++)
    {
        Parameter* par = (Parameter*)ParameterList.at(i);
        QStringList line;
        line.append( QString::number(par->id()));
        line.append( par->name());
        line.append(QString::number(par->value()));
        res.append( line.join(":") );
        res.append( "\n" );
    }

#ifdef QT_DEBUG
    QFile file("data/parameters.txt");
#else
    QFile file("/root/qtapp/data/parameters.txt");
#endif
    if ( !file.open(QFile::WriteOnly | QFile::Truncate))
    {
        qDebug() << "Failed to save parameter file";
        return;
    }
    if ( file.write( res.toLatin1() ) != res.size() )
    {
        qDebug() << "Failed to write parameter file";
        return;
    }
    file.close();
}


