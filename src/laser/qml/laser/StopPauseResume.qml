import QtQuick 1.0

Rectangle {
    width: 800
    height: 320
    color: "#00757575"
    //radius: 10


    property int txtCount:0;

    Rectangle {
        id: rectangle1
        x: 8
        y: 0
        width: 784
        height: 158
        color: "#80eeeeee"
        //radius: 8
    }

    Button {
        id: btnStop
        x: 38
        y: 164
        width: 200
        height: 148
        //radius: 5
        icon: "../../images/stop.png"
        text: "Stop"
        imgstatus: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#aaff0000"
            }

            GradientStop {
                position: 1
                color: "#aa000000"
            }
        }

        onClicked:{
            laserModel.stop();
            btnPause.text = "Pause"
            btnPause.icon = "../../images/pause.png"
            main.state = "File";
            toolbar.state = "";
            toolbar.fromPause = false;
        }
    }

    Button {
        id: btnPause
        x: 300
        y: 164
        width: 200
        height: 148
        //radius: 5
        icon: "../../images/pause.png"
        text: "Pause"
        imgstatus: 0
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
            if(btnPause.text == "Resume"){
                laserModel.resume();
                btnPause.text = "Pause"
                btnPause.icon = "../../images/pause.png"
                toolbar.state = "Start";
            } else {
                laserModel.pause();
                btnPause.text = "Resume"
                btnPause.icon = "../../images/resume.png"
                toolbar.state = "Pause";
            }
        }
    }

    Text {
        x: 144
        y: 91
        width: 256
        height: 46
        text: txtTime
        horizontalAlignment: Text.AlignRight
        font.bold: false
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        x: 531
        y: 91
        width: 251
        height: 46
        text: txtCount
        font.bold: false
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        x: 406
        y: 91
        text: qsTr("Count:")
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        x: 38
        y: 91
        text: qsTr("Time:")
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        id: text4
        x: 554
        y: 164
        width: 145
        height: 70
        color: "#000000"
        text: setPointP.toFixed(1)
        verticalAlignment: Text.AlignVCenter
        font.family: myCustomFont.name
        font.pixelSize: 40
    }

    Button {
        id: button1
        x: 554
        y: 237
        width: 100
        height: 75
        text: "-"
    }

    Button {
        id: button2
        x: 654
        y: 237
        width: 100
        height: 75
        text: "+"
    }

    Text {
        id: text2
        x: 38
        y: 22
        width: 84
        height: 40
        text: qsTr("File:")
        font.family: myCustomFont.name
        font.pixelSize: 40
    }

    Text {
        id: text3
        x: 144
        y: 17
        width: 638
        height: 45
        text: fileName
        font.bold: false
        font.family: myCustomFont.name
        font.pixelSize: 40
    }

    Text {
        x: 705
        y: 164
        width: 49
        height: 70
        text: qsTr("b")
        verticalAlignment: Text.AlignVCenter
        font.family: myCustomFont.name
        font.pixelSize: 40
    }

}

