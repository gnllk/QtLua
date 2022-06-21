QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/lua/
else: unix:!android: target.path = /opt/lua/
!isEmpty(target.path): INSTALLS += target

# target
INCLUDEPATH += $$PWD
CONFIG(release, debug|release){
    DESTDIR = $$PWD/../release/
} else {
    DESTDIR = $$PWD/../debug/
}
