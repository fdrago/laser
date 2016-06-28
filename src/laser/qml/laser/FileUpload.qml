import QtQuick 1.0

Rectangle {
    width: 800
    height: 320
    color: "transparent"
    //radius: 10

    Text {
        id: text1
        x: 450
        y: 8
        width: 200
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
        x: 425
        y: 54
        width: 350
        height: 258
        clip: true
        highlight: Rectangle
        {
            x: 3
            width: 350
            color:"#ffffff"
            //radius: 5
            opacity: 0.8
        }
        delegate: usbFileItem
        model: usbFileModel
    }

    Button {
        id: button1
        x: 50
        y: 8
        width: 300
        height: 80
        text: "Download"
        icon: "../../images/download.png"
        onClicked: {
            laserModel.uploadFile(255)
        }
    }

    Rectangle {
        id: info
        x: 50
        y: 95
        width: 300
        height: 130
        color: "#80b3b3b3"
        //radius: 10
        visible: true

        Text {
                id: text2
                x: 31
                y: 15
                text: qsTr("Usb detected")
                anchors.horizontalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 40
                font.family: myCustomFont.name
        }

        Rectangle {
            id: progress
            x: 8
            y: 72
            width: 284
            height: 36
            color: "#a0b3b3b3"
            visible: false
            Rectangle {
                id: bar
                x: 0
                y: 8
                width: 284
                height: 20
                color: "#24c72b"
            }
        }


    }
Button {
    id: back
    x: 50
    y: 232
    width: 300
    height: 80
    text: "Back"
    icon: ""
    onClicked: main.state = "File";
}
}

