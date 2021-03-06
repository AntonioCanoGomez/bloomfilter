# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = bloomfilter

CONFIG += sailfishapp

SOURCES += src/bloomfilter.cpp \
    bloomfilters.cpp

OTHER_FILES += qml/bloomfilter.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/bloomfilter.spec \
    rpm/bloomfilter.yaml \
    bloomfilter.desktop \
    qml/pages/ThirdPage.qml \
    qml/pages/FourthPage.qml \
    qml/pages/content/logic.js

HEADERS += \
    bloomfilters.h

