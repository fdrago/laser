import QtQuick 1.0

Rectangle {
    id: container
    width: 400
    height: 400
    color: "#00757575"
    //radius: 10

    Component {
        id: fileDelegate
        Rectangle {
            id: fileDelegateRectangle
            height: fileDelegateText.height * 1.5
            width: parent.width

            color: "#aab2b2b2"

            Text {
                id: fileDelegateText
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: myCustomFont.name
                text: modelData
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listFile.currentIndex = index;
                    startStopTest.fileName = modelData;
                    laserModel.setFile(index+1);
                    stopPauseResume1.txtCount = 0;
                }
            }
        }
    }

    ListView {
        id: listFile
        x: 25
        y: 25
        width: 350
        height: 220
        clip: true
        delegate: fileDelegate
        model: cutModel
        highlight: Rectangle
        {
            x: 3
            width: 350
            color:"#ffffff"
            //radius: 5
            opacity: 0.8
        }
    }

    Button {
        id: btnDelete
        x: 50
        y: 270
        width: 300
        height: 80
        icon: "../../images/delete.png"
        text: "Delete"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#aaffdd00"
            }

            GradientStop {
                position: 1
                color: "#aa000000"
            }
        }
        onClicked: {
            startStopTest.fileName = "";
            laserModel.deleteFile();
        }
    }


}
