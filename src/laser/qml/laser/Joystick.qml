import QtQuick 1.0

Rectangle {
    width: 400
    height: 400
    color: "#00757575"
    radius: 10

    Button {
        id: btnZsu
        x: 8
        y: 110
        width: 80
        height: 80
        text: ""
        backGround: "../../images/zSu.png"
        onPressed: laserModel.moveZplus()
        onRelased: laserModel.moveStop()
    }

    Button {
        id: btnZgiu
        x: 8
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
        x: 210
        y: 70
        width: 80
        height: 80
        text: ""
        backGround: "../../images/su.png"
        onPressed: laserModel.moveXplus()
        onRelased: laserModel.moveStop()
    }

    Button {
        id: btnDx
        x: 300
        y: 160
        width: 80
        height: 80
        text: ""
        backGround: "../../images/dx.png"
        onPressed: laserModel.moveYplus()
        onRelased: laserModel.moveStop()
    }

    Button {
        id: btnGiu
        x: 210
        y: 250
        width: 80
        height: 80
        text: ""
        backGround: "../../images/giu.png"
        onPressed: laserModel.moveXminus()
        onRelased: laserModel.moveStop()
    }

    Button {
        id: btnSx
        x: 120
        y: 160
        width: 80
        height: 80
        text: ""
        backGround: "../../images/sx.png"
        onPressed: laserModel.moveYminus()
        onRelased: laserModel.moveStop()
    }

    Text {
        id: text1
        x: 40
        y: 63
        text: qsTr("Z")
        font.bold: true
        font.pixelSize: 24
        font.family: myCustomFont.name
    }

}
