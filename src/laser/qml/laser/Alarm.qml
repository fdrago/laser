import QtQuick 1.0

Rectangle {
    width: 800
    height: 400
    color: "transparent"

    property string alMessage: ""
    property string alImage: ""

    Connections {
        target: laserModel

        onAllarme: {
            message.text = alMessage
            image.source = alImage
        }
    }

    Image {
        id: image
        x: 48
        y: 50
        width: 300
        height: 300
        fillMode: Image.Stretch
        source: alImage
    }

    Text {
        id: message
        x: 420
        y: 128
        width: 324
        height: 158
        text: alMessage
        font.family: myCustomFont.name
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 31
    }

    MouseArea {
        id: mouseArea1
        x: 8
        y: 22
        width: 800
        anchors.fill: parent;
        //enabled: alBloking;
        onClicked: {
            laserModel.noalarm();
        }

        Button {
            x: 689
            y: 8
            width: 91
            height: 66
            text: ""
            icon: "../../images/clear.png"
            visible: closeAlarm;
            onClicked: {
                laserModel.ackAlarm();
            }
        }
    }
}
