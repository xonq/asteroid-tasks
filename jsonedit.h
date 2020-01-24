#ifndef JSONEDIT_H
#define JSONEDIT_H

#include <QObject>
#include <QString>
#include <QJsonObject>

class JsonEdit : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QJsonObject jdata READ jdata WRITE setJdata NOTIFY jdataChanged)

public:

    QJsonObject jdata() const {
        return m_jdata;
    }

signals:
    void jdataChanged();

public slots:
    QJsonObject editJdata(QJsonObject jdata, QString date, QString index, QString value);
    QJsonObject addToday(QJsonObject jdata, QString date);
    void setJdata(QJsonObject jdata) {
        if (jdata != m_jdata) {
            m_jdata = jdata;
            emit jdataChanged();
        }
    }

private:
    QJsonObject m_jdata;
    void saveJdata(QJsonObject jdata);
};


#endif // JSONEDIT_H
