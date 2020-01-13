TRGET = asteroid-goals
CONFIG += asteroidapp
PKGCONFIG += dbus-1 dbus-glib-1
QT += dbus multimedia

SOURCES +=     main.cpp volumecontrol.cpp
HEADERS +=     volumecontrol.h
RESOURCES +=   resources.qrc
OTHER_FILES += main.qml \
               TimePage.qml \
               DatePage.qml \
               BrightnessPage.qml \
               AboutPage.qml

lupdate_only{ SOURCES += i18n/asteroid-goals.desktop.h }
TRANSLATIONS = $$files(i18n/$$TARGET.*.ts)
