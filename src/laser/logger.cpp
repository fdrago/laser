#include "logger.h"

#include <QDateTime>
#include <QFile>
#include <QTextStream>
#include <QString>
#include <QList>

#ifdef QT_DEBUG
#define LOG_FILE "data/logfile.txt"
#else
#define LOG_FILE "/root/laser/data/logfile.txt"
#endif


#define MAX_SIZE 100
#define SEPARATOR '|'


Logger::Logger(QObject *parent) : QObject(parent)
{

}

void Logger::load()
{
    QFile data( LOG_FILE );
    if ( !data.open(QFile::ReadOnly | QFile::Append))
    {
        return;
    }

    QByteArray line;
    do
    {
        line = data.readLine();
        if (line.size()<=0)
            continue;

        QList<QByteArray> l = line.split( SEPARATOR );
        if ( l.size()<=1 )
            continue;

        uint ts = l.at(0).toInt();
        mm_LogMap[ ts ] = l.at(1);

    }
    while ( line.size()>0 );
}

void Logger::log(const QString &str)
{
    uint ts = QDateTime::currentDateTime().toTime_t();
    mm_LogMap[ts] = str;
    save();
}

QStringList Logger::logs()
{
    QStringList res;
    QMap<uint, QString>::iterator it;
    for ( it = mm_LogMap.begin(); it!= mm_LogMap.end() ; it++ )
    {
        QString s = QString("%1 : %2").arg( it.key() ).arg( it.value() );
        res.append(res);
    }
    return res;
}

void Logger::save()
{
    QFile data( LOG_FILE );
    if ( !data.open(QFile::WriteOnly | QFile::Append))
    {
        return;
    }

    QTextStream out(&data);

    int offset = 0;
    if ( mm_LogMap.size() > MAX_SIZE )
    {
        offset = MAX_SIZE -  mm_LogMap.size();
    }

    QMap<uint, QString>::iterator it = mm_LogMap.begin();

    it += offset;

    for ( ; it!= mm_LogMap.end() ; it++ )
    {
        QString s = QString("%1|%2").arg( it.key() ).arg( it.value() );
        out << s;
    }
}
