#ifndef LOGGER_H
#define LOGGER_H

#include <QObject>
#include <QMap>
#include <QString>
#include <QList>
#include <QStringList>

class Logger : public QObject
{
    Q_OBJECT
public:
    explicit Logger(QObject *parent = 0);

signals:

public slots:

    Q_INVOKABLE void load();
    Q_INVOKABLE void log(const QString& str);

    QStringList logs();

private slots:
    void save();

private:
    QMap<uint, QString> mm_LogMap;
 };


#endif // LOGGER_H
