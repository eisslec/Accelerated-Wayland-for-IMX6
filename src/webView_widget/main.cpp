
/****************************************************************************
WebView Widget Demonstration

Author: Christian Eissler

Description:
Demonstration of a simple fullscreen Webview using QtWebkit and
the webView Widget
****************************************************************************/

#include <QtWidgets>
#include <QWebView>
#include <QGraphicsWebView>
#include <QWebInspector>
#include <QGLWidget>
#include <QDebug>
#include <QtOpenGL/QtOpenGL>

#include "mainwindow.h"

int main(int argc, char * argv[])
{
    QApplication app(argc, argv);

    QWebView webView;
    webView.load(QUrl("http://google.de"));
    //webView.load(QUrl("http://localhost/tabletDemo/src"));
    webView.showFullScreen();

    //qDebug() << view->page();
    //inspector->setPage(view->page());
    //inspector->show();
    //inspector->setVisible(true);
    //view->show();
    //view->addAction();

    //MainWindow window;
    //window.showFullScreen();


    //QGLWidget* glwidget = new QGLWidget();
    //glwidget->show();





//    const int width = 1000;
//    const int height = 600;
//    QWebSettings::globalSettings()->setAttribute(QWebSettings::AcceleratedCompositingEnabled, true);
//    QGraphicsScene scene;



//    QGraphicsView view(&scene);
//    view.setFrameShape(QFrame::NoFrame);
//    view.setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
//    view.setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
//    view.setViewport(new QGLWidget(QGLFormat(QGL::SampleBuffers)));

//    QGraphicsWebView webview;
//    webview.resize(width, height);
//    webview.load(QUrl("http://google.de"));

//    scene.addItem(&webview);

//    view.resize(width, height);
//    view.show();


    return app.exec();
}
