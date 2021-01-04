#include <string>
#include <fstream>
#include <iostream>
#include <vector>
#include "jsonedit.h"
#include <QFile>
#include <QJsonDocument>
#include <QTextStream>
#include <QJsonObject>
#include <QIODevice>
#include <QJsonValue>
#include <QJsonDocument>
#include <QJsonArray>
#include <QAbstractItemModel>

    using namespace std;

QJsonObject JsonEdit::addToday(QJsonObject jdata, QString date)
{
    if (! jdata.contains(date)) {
        QJsonArray Array = jdata.value("template").toArray();
        jdata.insert(date, Array);
        saveJdata(jdata);
    }
    return jdata;
}

QJsonObject JsonEdit::editJdata(QJsonObject jdata, QString date, QString int_index, QString value)
{
    int index = int_index.toInt();
    QJsonArray Array = jdata.value(date).toArray();
    QJsonArray Array1 = Array.at(index).toArray();
    Array1.removeAt(4);
    Array1.insert(4, QJsonValue(value));
    Array.removeAt(index);
    Array.insert(index, Array1);
    jdata.insert(date, Array);
    saveJdata(jdata);
    return jdata;
}

void JsonEdit::saveJdata(QJsonObject jdata)
{
    QFile saveFile("/home/ceres/tasks/template.json");
    QJsonDocument saveDoc(jdata);
    if (! saveFile.open(QIODevice::WriteOnly)) {
        exit(2);
    }
    saveFile.write(saveDoc.toJson());
    saveFile.close();
    emit jdataChanged();
}
