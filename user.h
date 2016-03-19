#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>
#include <QAbstractListModel>
#include <QStringList>
#include <QDateTime>


class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE name NOTIFY nameChanged)
    Q_PROPERTY(int level READ level WRITE level NOTIFY levelChanged)
    Q_PROPERTY(QString time READ time WRITE time NOTIFY timeChanged)
    Q_PROPERTY(QString password READ password WRITE password NOTIFY passwordChanged)

public:
    User();
    User(const QString &name, const int &level, const QString &time, const QString password);
    ~User();
    void level(int level) {_level = level; emit levelChanged();}
    int level() const;

    void name(QString username) {if(username.isEmpty()) username="USER"; _username = username; emit nameChanged(); }
    QString name() const;

    void time(QString time);
    QString time() const;
    void addTime(QString nt);

    void password(QString password) { _password = password; emit passwordChanged();}
    QString password() const;
signals:
    void nameChanged();
    void levelChanged();
    void timeChanged();
    void passwordChanged();

public slots:

private:
    int _level;
    QString _username;
    QString _time;
    int h;
    int m;
    QString _password;
};


#endif // USER_H
