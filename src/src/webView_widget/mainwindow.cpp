#include "mainwindow.h"

#include <QGLWidget>
#include <QWebSettings>

MainWindow::MainWindow() {
    int width = 800;
    int height = 480;

    QWebSettings::globalSettings()->setAttribute(QWebSettings::AcceleratedCompositingEnabled, true);
    //QWebInspector *inspector = new QWebInspector();


    graphicView = new QGraphicsView(this);
    graphicView->setViewportUpdateMode(QGraphicsView::FullViewportUpdate);
    graphicView->setViewport(new QGLWidget());

    scene = new QGraphicsScene(graphicView);
    webView = new QGraphicsWebView();

    scene->addItem(webView);
    graphicView->setScene(scene);

    //webView->load(QUrl("http://localhost/tabletDemo/src"));
    webView->load(QUrl("http://google.de"));

    //webView->setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding);

    setCentralWidget(graphicView);

    //webView->resize(width, height);
    //graphicView->resize(width, height);
    //webView->setResizesToContents(true);

    graphicView->show();
}
