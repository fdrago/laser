#ifndef PARAMLIST_H
#define PARAMLIST_H

#include <QObject>
#include <QList>
#include "qextserialport.h"
#include "parameter.h"


class ParamList : public QObject
{
    Q_OBJECT
public:
    explicit ParamList(QObject *parent = 0);
    ~ParamList();
        void load();
    QList<QObject*> paramlist() { return ParameterList; }

    Q_INVOKABLE int ParamValFromId( int id );
    Q_INVOKABLE int ParamValFromName( QString paramname );
    Q_INVOKABLE QString ParamNameFromId( int id );
    Q_INVOKABLE Parameter* ParamFromId(int id);
    Q_INVOKABLE void save();



signals:


public slots:



private:
    QList<QObject*> ParameterList;

    int value(QString ParamName);
    int loadFile();

};

#endif // PARAMLIST_H
