/*
 * Copyright (C) 2017 - Florent Revest <revestflo@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
#include <QGuiApplication>
#include <QQuickView>
#include <QScreen>
#include <QtQml>
#include <string>
#include <vector>
#include <iostream>
#include <QFile>
#include <QIODevice>
#include <QJsonDocument>
#include <QTextStream>
#include <QJsonObject>
#include <QJsonArray>
#include <QVariantMap>
#include <QVariantList>
#include <QStringList>
#include <asteroidapp.h>
#include "jsonedit.h"

    using namespace std;

int main(int argc, char *argv[]){

    qDebug() << "hello";

    // NEED TO CONVERT THIS TO APPROPRIATE PATH
    QFile file_obj("/home/ceres/tasks/template.json");

    // NEED TO MAKE NEW taskObjECT IF IT DOESN'T EXIST
    if(! file_obj.open(QIODevice::ReadOnly)) {
        qDebug() << "failed";
    }

    QTextStream file_text(&file_obj);
    QString json_string;
    json_string = file_text.readAll();
    file_obj.close();
    QByteArray json_bytes = json_string.toLocal8Bit();

    auto json_doc = QJsonDocument::fromJson(json_bytes);

    QJsonObject dataObj = json_doc.object();

    //NEED TO MAKE MAKE A NEW FILE
    if(dataObj.isEmpty()){
        qDebug() << "empty";
        exit( 3 );
    }

    QScopedPointer<QGuiApplication> app(AsteroidApp::application(argc, argv));
    QScopedPointer<QQuickView> view(AsteroidApp::createView());

    qmlRegisterType<JsonEdit>("org.tasks.jedit", 1, 0, "JsonEdit");

    // NEED TO ADD AND DETERMINE DUE (split todayArr into due and all)
    JsonEdit nullObj;
    view->rootContext() -> setContextProperty("jedt", &nullObj);
    view->rootContext() -> setContextProperty("dataObj", dataObj);
    view->setSource(QUrl("qrc:/main.qml"));
    view->resize(app->primaryScreen()->size());
    view->show();
    return app->exec();
}
