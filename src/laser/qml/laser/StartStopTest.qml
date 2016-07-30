import QtQuick 1.0

Rectangle {
    width: 300
    height: 320
    color: "#00757575"

    property string btnListText:""
    property string fileName:""

    onFileNameChanged: {
        text3.text= fileName
    }

    x: 0
    y: 0

    Button {
        id: btnStart
        x: 8
        y: 60
        width: 250
        height: 80
        icon: "../../images/start.png"
        state: (enableButton && fileName != "") ? "" : "Disable";
        text: "Start"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 1
                color: "#aa000000"
            }
        }

        onClicked:{
            if(main.state!="WaitList"){
                laserModel.start();
                main.state = "StopResume";
                btnLogin.state="Disable";
                stopPauseResume1.txtCount++;
                laserModel.log("Start cut " + fileName)
            }
        }
    }


    Button {
        id: btnTest
        x: 8
        y: 146
        width: 250
        height: 80
        text: "Test"
        icon: "../../images/test.png"

        onClicked:{
            if(main.state!="WaitList"){
                laserModel.test();
            }



        }
    }

    Button {
        id: btnList
        x: 8
        y: 232
        width: 250
        height: 80
        icon: (main.state=="File" || main.state=="WaitList") ? "../../images/list.png" : "../../images/joy.png";
        text: (main.state=="File" /*|| main.state=="WaitList"*/) ? "List" : "Joypad";

        onClicked: {

            //main.state = "WaitList"
            if(main.state!="WaitList"){
                if(text=="List") {
                    main.state = "WaitList"
                    laserModel.callGetFilesList()
                    //main.state = "Choose"
                } else {
                    main.state = "File"
                }
            }

        }
    }

    Text {
        id: text2
        x: 8
        y: 8
        width: 84
        height: 40
        text: qsTr("File:")
        font.family: myCustomFont.name
        font.pixelSize: 40
    }

    Text {
        id: text3
        x: 98
        y: 3
        width: 202
        height: 45
        text: ""
        //font.family: myCustomFont.name
        font.pixelSize: 40
        visible: (main.state=="Choose" || main.state=="File")? true : false
    }

}
