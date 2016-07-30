import QtQuick 1.0

Rectangle {
    id: about
    width: 300
    height: 200

    signal clicked

    color: "#F0b2b2b2"

    Rectangle {
        width: parent.width
        height: 25
        color: "#8da4f2"
    Text {
        id: text1
        x: 0
        y: 0
        text: "ABOUT"
        font.pixelSize: 21
    }
    }

    Text {
        id: txtIp
        x: 39
        y: 50
        text: "IP:"
        font.pixelSize: 16
    }
    Text {
        id: text2
        x: 60
        y: 50
        text: ipAddress
        font.pixelSize: 16
    }

    Text {
        id: txtVer
        x: 39
        y: 136
        text: "Ver 1.6"
        font.pixelSize: 16
    }

    MouseArea {
        id: mouseArea1
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        onPressed: parent.clicked();

    }
}
