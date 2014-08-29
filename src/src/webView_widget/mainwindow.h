#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QGraphicsWebView>

class MainWindow : public QMainWindow {
public:
    MainWindow();
private:
    QGraphicsView* graphicView;
    QGraphicsScene* scene;
    QGraphicsWebView *webView;
};

#endif // MAINWINDOW_H
