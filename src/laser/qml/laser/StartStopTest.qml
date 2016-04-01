import QtQuick 1.0

Rectangle {
    width: 400
    height: 400
    color: "#00757575"
    radius: 10

    property string btnListText:""
    property string fileName:""

    Button {
        id: btnStart
        x: 51
        y: 87
        width: 299
        height: 80
        radius: 4
        icon: "../../images/start.png"
        state: (enableButton && fileName != "") ? "" : "Disable";
        text: "Start"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#aa00ff55"
            }

            GradientStop {
                position: 1
                color: "#aa000000"
            }
        }

        onClicked:{
            laserModel.start();
            main.state = "StopResume";
            btnLogin.state="Disable";
            stopPauseResume1.txtCount++;
        }
    }


    Button {
        id: btnTest
        x: 51
        y: 187
        width: 300
        height: 80
        text: "Test"
        icon: "../../images/test.png"

        onClicked:{
            laserModel.test();

        }
    }

    Button {
        id: btnList
        x: 51
        y: 285
        width: 299
        height: 80
        icon: (main.state=="File") ? "../../images/list.png" : "../../images/joy.png";
        text: (main.state=="File") ? "List" : "Joypad";

        onClicked: {
            if(text=="List") {
                laserModel.getFilesList();
                main.state = "Choose"
            } else {
                main.state = "File"
            }
        }
    }

    Text {
        id: text1
        x: 8
        y: 23
        width: 84
        height: 40
        text: qsTr("File:")
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        id: text2
        x: 98
        y: 23
        width: 281
        height: 45
        text: fileName
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

}
