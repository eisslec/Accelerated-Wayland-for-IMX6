#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QtWebKit/QWebSettings>

#include <QtPlugin>
//Q_IMPORT_PLUGIN(QEglFSIntegrationPlugin);
//Q_IMPORT_PLUGIN(QTsLibPlugin);

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //QQuickView viewer;
    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/webView_qml/main.qml"));
    //viewer.showExpanded();
    //viewer.setSource(QUrl("qml/webView_qml/main.qml"));
    viewer.show();
    return app.exec();
}
