import QtQuick 1.0

Rectangle {
    width: 500
    height: 320
    color: "#00757575"

    Connections{
        target: startStopTest;
        onFilenameChanged{

        }


    }

    Button {
        id: btnZsu
        x: 60
        y: 90
        width: 80
        height: 80
        text: ""
        backGround: "../../images/zSu.png"
        onPressed: laserModel.moveZplus()
        onRelased: laserModel.moveStop()
    }

    Button {
        id: btnZgiu
        x: 60
        y: 210
        width: 80
        height: 80
        text: ""
        backGround: "../../images/zGiu.png"
        onPressed: laserModel.moveZminus()
        onRelased: laserModel.moveStop()
    }

    Button {
        id: btnSu
        x: 280
        y: 60
        width: 80
        height: 80
        text: ""
        backGround: "../../images/su.png"
        onPressed: {
            laserModel.moveXplus();
            console.log("pressed");
        }
        onRelased:{
            laserModel.moveStop();
            console.log("released");
        }


    }

    Button {
        id: btnDx
        x: 370
        y: 150
        width: 80
        height: 80
        text: ""
        backGround: "../../images/dx.png"
        onPressed: laserModel.moveYplus()
        onRelased: laserModel.moveStop()
    }

    Button {
        id: btnGiu
        x: 280
        y: 240
        width: 80
        height: 80
        text: ""
        backGround: "../../images/giu.png"
        onPressed: laserModel.moveXminus()
        onRelased: laserModel.moveStop()
    }

    Button {
        id: btnSx
        x: 190
        y: 150
        width: 80
        height: 80
        text: ""
        backGround: "../../images/sx.png"
        onPressed: laserModel.moveYminus()
        onRelased: laserModel.moveStop()
    }

    Text {
        id: text1
        x: 92
        y: 176
        text: qsTr("Z")
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.pixelSize: 24
        font.family: myCustomFont.name
    }

    Text {
        id: text3
        x: 0
        y: 3
        width: 492
        height: 45
        text: StartStopTest.fileName
        font.family: myCustomFont.name
        font.pixelSize: 40
    }

}
