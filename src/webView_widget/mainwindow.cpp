#include "mainwindow.h"

#include <QGLWidget>
#include <QWebSettings>

MainWindow::MainWindow() {
    int width = 800;
    int height = 480;

    QWebSettings::globalSettings()->setAttribute(QWebSettings::AcceleratedCompositingEnabled, true);
    //QWebInspector *inspector = new QWebInspector();

    scene = new QGraphicsScene();

    graphicView = new QGraphicsView(scene);
    graphicView->setViewportUpdateMode(QGraphicsView::BoundingRectViewportUpdate);
    //graphicView->setViewport(new QGLWidget);

    webView = new QGraphicsWebView();
    webView->resize(width, height);

    //webView->load(QUrl("http://localhost/tabletDemo/src"));
    webView->load(QUrl("http://google.de"));
    scene->addItem(webView);
    graphicView->resize(width, height);
    //webView->setResizesToContents(true);

    graphicView->show();
}
