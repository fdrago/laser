import QtQuick 1.0

Rectangle {
    width: 800
    height: 400
    color: "transparent"
    radius: 10

    Text {
        id: text1
        x: 424
        y: 5
        text: qsTr("USB files")
        font.pixelSize: 35
        font.family: myCustomFont.name
    }

    Component {
        id: usbFileItem
        Rectangle {
            id: usbFileDelegateRectangle
            x: 5
            width: 340
            height: usbFileDelegateText.height * 1.5

            color: "#aab2b2b2"

            Text {
                id: usbFileDelegateText
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: myCustomFont.name
                text: modelData
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    usbFileList.currentIndex = index;
                    laserModel.uploadFile(index)
                }
            }
        }
    }

    ListView {
        id: usbFileList
        x: 424
        y: 51
        width: 350
        height: 324
        clip: true
        highlight: Rectangle
        {
            x: 3
            width: 350
            color:"#ffffff"
            radius: 5
            opacity: 0.8
        }
        delegate: usbFileItem
        model: usbFileModel
    }

    Button {
        id: button1
        x: 41
        y: 51
        width: 347
        height: 80
        text: "Download all files"
        icon: "../../images/download.png"
        onClicked: {
            laserModel.uploadFile(255)
        }
    }

    Rectangle {
        id: info
        x: 41
        y: 159
        width: 347
        height: 216
        color: "#80b2b2b2"
        radius: 10
        visible: true

        Text {
                id: text2
                x: 25
                y: 39
                text: qsTr("Usb detected")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 40
                font.family: myCustomFont.name
        }

        Rectangle {
            id: progress
            x: 8
            y: 143
            width: 311
            height: 36
            color: "#a0b2b2b2"
            visible: false
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                id: bar
                x: 8
                y: 8
                width: 300
                height: 20
                color: "#25c82e"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}

