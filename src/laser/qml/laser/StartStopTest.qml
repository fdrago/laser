import QtQuick 1.0

Rectangle {
    width: 400
    height: 400
    color: "#00757575"
    //radius: 10

    property string btnListText:""
    property string fileName:""
    x: 0
    y: 0

    Button {
        id: btnStart
        x: 50
        y: 60
        width: 300
        height: 80
        //radius: 4
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
        x: 50
        y: 165
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
        x: 50
        y: 270
        width: 300
        height: 80
        icon: (main.state=="File" || main.state=="WaitList") ? "../../images/list.png" : "../../images/joy.png";
        text: (main.state=="File" || main.state=="WaitList") ? "List" : "Joypad";

        onClicked: {

            //main.state = "WaitList"

            if(text=="List") {
                main.state = "WaitList"
                laserModel.callGetFilesList()
                //main.state = "Choose"
            } else {
                main.state = "File"
            }

        }
    }

    Text {
        id: text1
        x: 8
        y: 7
        width: 84
        height: 40
        text: qsTr("File:")
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        id: text2
        x: 98
        y: 7
        width: 281
        height: 45
        text: fileName
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

}
