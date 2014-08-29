import QtQuick 2.0
import QtWebKit 3.0
import QtWebKit.experimental 1.0

Rectangle {
   /* Text {
        id: text
        text: qsTr("Hallo IMX6")
        height: 80
        anchors.fill: parent
    }*/
    WebView {
        id: webview
        //url: "http://localhost/tabletDemo/src"
        url: "http:google.com"
        anchors.fill: parent
    }

    /*MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }*/
}
