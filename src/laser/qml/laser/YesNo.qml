import QtQuick 1.0

Rectangle {
    width: 300
    height: 160
    color: "#2ecd24"

    property string cmd: "";

    Button {
        id: button1
        x: 39
        y: 88
        width: 107
        height: 51
        text: "Yes"
        onClicked: {
            config1.state = "";
            if(cmd=="water")
                laserModel.setClearWater();
            if(cmd=="guide")
                laserModel.setClearGuide();
            if(cmd=="filter")
                laserModel.setClearFilter();
        }
    }

    Button {
        id: button2
        x: 152
        y: 88
        width: 107
        height: 51
        text: "No"
        onClicked: {
            config1.state = "";
        }
    }

    Text {
        id: text1
        x: 39
        y: 27
        width: 220
        height: 45
        text: qsTr("Confirm?")
        font.pixelSize: 36
        font.family: myCustomFont.name
    }
}

