QT      +=  webkitwidgets network widgets opengl
SOURCES += \
    main.cpp \
    mainwindow.cpp

# install
target.path = /usr/bin/webView_widget
INSTALLS += target

FORMS +=

HEADERS += \
    mainwindow.h
