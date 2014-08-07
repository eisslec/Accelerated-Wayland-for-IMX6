QT += qml quick

# Add more folders to ship with the application, here
folder_01.source = qml/webView_qml
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
#QML_IMPORT_PATH = /opt/poky/1.6.1/sysroots/cortexa9hf-vfp-neon-poky-linux-gnueabi/usr/lib/qt5/qml/QtWebKit/experimental

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Installation path
target.path = /usr/bin/webView_qml
INSTALLS += target

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()
