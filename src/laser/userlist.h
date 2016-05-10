#ifndef USERLIST_H
#define USERLIST_H

#include <QObject>
#include <QMap>
#include <QStringList>

#include "user.h"

class UserList : public QObject
{
    Q_OBJECT
public:
    explicit UserList(QObject *parent = 0);
    ~UserList();

    void load();
    bool contains(QString codice);
    User * value(QString codice);
    Q_INVOKABLE void add();
    Q_INVOKABLE void remove(int idx);


    void setName(int idx, QString name);
    void setPwd(int idx, QString pwd);
    void setLevel(int idx, int level);

    QList<QObject*> userlist() { return dataList; }

signals:
    void listChanged();

public slots:
    void save();

private:
    QList<QObject*> dataList;
};

#endif // USERLIST_H
