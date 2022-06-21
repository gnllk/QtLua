QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

SOURCES += \
        main.cpp

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

# copy files
Others.files += $$PWD/demo.lua
CONFIG(release, debug|release) {
    Others.path = $$PWD/../release/
} else {
    Others.path = $$PWD/../debug/
}
COPIES += Others
