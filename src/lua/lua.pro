QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

HEADERS += \
        $$PWD/../lual/lua.h

SOURCES += \
        $$PWD/../lual/lua.c

# Default rules for deployment.
qnx: target.path = /tmp/lua/
else: unix:!android: target.path = /opt/lua/
!isEmpty(target.path): INSTALLS += target

# lua library
INCLUDEPATH += $$PWD/../lual
DEPENDPATH += $$PWD/../lual
CONFIG(debug, debug|release) {
    LIBS += -L$$PWD/../debug/ -llual
} else {
    LIBS += -L$$PWD/../release/ -llual
}

# target
INCLUDEPATH += $$PWD
CONFIG(release, debug|release){
    DESTDIR = $$PWD/../release/
} else {
    DESTDIR = $$PWD/../debug/
}
