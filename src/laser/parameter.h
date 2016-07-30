#ifndef PARAMETER_H
#define PARAMETER_H

#include <QObject>
#include <QString>
#include <QAbstractListModel>
#include <QStringList>
#include <QDateTime>


class Parameter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name)
    Q_PROPERTY(int value READ value)

public:
    Parameter();
    Parameter(const int &id,const QString &name, const int &value );
    ~Parameter();
    void name(QString paramname) {if(paramname.isEmpty()) paramname="NULL"; _name = paramname;}
    void value(int paramvalue) { _value = paramvalue;}
    void id(int paramid) { _id = paramid;}

    QString name() const;
    int value();
    int id() const;

signals:

public slots:

private:
    QString _paramname;
    QString _name;
    int _paramvalue;
    int _value;
    int _id;

};

#endif // PARAMETER_H
