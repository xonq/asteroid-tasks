TRGET = asteroid-tasks
CONFIG += asteroidapp
PKGCONFIG += dbus-1 dbus-glib-1
QT += dbus multimedia

SOURCES +=     main.cpp \
    jsonedit.cpp
HEADERS += jsonedit.h
RESOURCES +=   resources.qrc
OTHER_FILES += main.qml \
               ListItem.qml \
               FloatPage.qml \
               DatePage.qml \
               BinaryPage.qml \
               AboutPage.qml

lupdate_only{ SOURCES += i18n/asteroid-tasks.desktop.h }
TRANSLATIONS = $$files(i18n/$$TARGET.*.ts)
