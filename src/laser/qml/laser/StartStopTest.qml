import QtQuick 1.0

Rectangle {
    width: 300
    height: 320
    color: "#00757575"
    //radius: 10

    property string btnListText:""
    property string fileName:""
    x: 0
    y: 0

    Button {
        id: btnStart
        x: 8
        y: 20
        width: 250
        height: 80
        //radius: 4
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
        y: 120
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
        y: 220
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

}
