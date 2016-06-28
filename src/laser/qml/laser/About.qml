import QtQuick 1.0

Rectangle {
    id: about
    width: 300
    height: 200

    signal clicked

    color: "#F0b2b2b2"
    //radius:10

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
        text: "Ver 1.4"
        font.pixelSize: 16
    }

    MouseArea {
        id: mouseArea1
        anchors.fill: parent
        onPressed: parent.clicked();

    }
}
