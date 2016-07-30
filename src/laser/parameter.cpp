#include "parameter.h"
#include <QStringList>
#include <QDebug>

Parameter::Parameter()
{

}

Parameter::Parameter(const int &id, const QString &name, const int &value)
{
    this->id(id);
    this->name(name);
    this->value(value);
}

Parameter::~Parameter()
{

}

int Parameter::id() const
{
    return _id;
}

int Parameter::value()
{
    return _value;
}

QString Parameter::name() const
{
    return _name;
}
