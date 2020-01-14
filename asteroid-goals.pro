TRGET = asteroid-goals
CONFIG += asteroidapp
PKGCONFIG += dbus-1 dbus-glib-1
QT += dbus multimedia

SOURCES +=     main.cpp \
    json_parse.cpp
RESOURCES +=   resources.qrc
OTHER_FILES += main.qml \
               ListItem.qml \
               TimePage.qml \
               DatePage.qml \
               BrightnessPage.qml \
               AboutPage.qml

lupdate_only{ SOURCES += i18n/asteroid-goals.desktop.h }
TRANSLATIONS = $$files(i18n/$$TARGET.*.ts)
