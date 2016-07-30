import QtQuick 1.0

Rectangle {
    width: 800
    height: 320
    color: "#00757575"

    property double setPointP: 0;
    property int setPointPset: 0;

    property int txtCount: 0
    property string txtTimeDisplay: "0:00:00"

    onTxtTimeDisplayChanged: {
        text1.text= txtTimeDisplay;
    }

    Rectangle {
        id: rectangle1
        x: 8
        y: 0
        width: 784
        height: 158
        color: "#80eeeeee"
    }

    Button {
        id: btnStop
        x: 28
        y: 164
        width: 200
        height: 148
        icon: "../../images/stop.png"
        text: "Stop"
        imgstatus: 0
        gradient: Gradient {
            GradientStop {
                id: gradientStop1
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
        x: 290
        y: 164
        width: 200
        height: 148
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
        id: text1
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
        id: text5
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
        id: text6
        x: 406
        y: 91
        text: qsTr("Count:")
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        id: text7
        x: 38
        y: 91
        text: qsTr("Time:")
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        id: text4
        x: 544
        y: 164
        width: 145
        height: 70
        color: "#000000"
        text: SetPointPset
        verticalAlignment: Text.AlignVCenter
        font.family: myCustomFont.name
        font.pixelSize: 40
    }

    Button {
        id: decreaseBut
        x: 544
        y: 237
        width: 100
        height: 75
        text: "-"
        onClicked: {
            laserModel.decPres();
            text: setPointPset
        }
    }

    Button {
        id: increaseBut
        x: 672
        y: 237
        width: 100
        height: 75
        text: "+"
        onClicked: {
            laserModel.incPres();
            text: setPointPset
        }
    }

    Text {
        id: text2
        x: 38
        y: 22
        width: 84
        height: 40
        text: qsTr("File:")
        //font.family: myCustomFont.name
        font.pixelSize: 40
    }

    Text {
        id: text3
        x: 144
        y: 17
        width: 638
        height: 45
        text: startStopTest.fileName
        font.bold: false
        //font.family: myCustomFont.name
        font.pixelSize: 40
    }

    Text {
        id: text8
        x: 695
        y: 164
        width: 77
        height: 70
        text: qsTr("bar")
        verticalAlignment: Text.AlignVCenter
        //font.family: myCustomFont.name
        font.pixelSize: 40
    }





        Rectangle {
            id: rectangle2
            x: 8
            y: -652
            width: 784
            height: 150
            color: "#ff0000"
            z: -2

            Text {
                id: message
                x: 0
                y: 0
                width: 784
                height: 150
                text: alMessage
                z: 1
                font.family: myCustomFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 31
            }
        }


    states: [
        State {
            name: "Alarm"

            PropertyChanges {
                target: rectangle1
                x: -2
                y: -588
            }

            PropertyChanges {
                target: text1
                x: 84
                y: 194
                width: 144
                height: 24
                font.pixelSize: 20
            }

            PropertyChanges {
                target: text5
                x: 356
                y: 194
                width: 134
                height: 24
                font.pixelSize: 20
            }

            PropertyChanges {
                target: text6
                x: 290
                y: 194
                width: 60
                height: 24
                font.pixelSize: 20
            }

            PropertyChanges {
                target: text7
                x: 28
                y: 194
                font.pixelSize: 20
            }

            PropertyChanges {
                target: text2
                x: 28
                y: 164
                width: 40
                height: 24
                font.pixelSize: 20
            }

            PropertyChanges {
                target: text3
                x: 84
                y: 164
                width: 406
                height: 24
                font.pixelSize: 20
            }

            PropertyChanges {
                target: rectangle2
                x: 8
                y: 8
            }

            PropertyChanges {
                target: gradientStop1
                color: "#aaff0000"
            }

            PropertyChanges {
                target: btnStop
                x: 28
                y: 237
                height: 75
            }

            PropertyChanges {
                target: btnPause
                x: 290
                y: 237
                height: 75
                text : "Resume"
                icon : "../../images/resume.png"
                Toolbar.state : "Pause"
            }

            PropertyChanges {
                target: text4
                x: 544
                y: 194
                height: 24
                font.pixelSize: 20
            }

            PropertyChanges {
                target: text8
                x: 695
                y: 194
                height: 24
                font.pixelSize: 20
            }
        }
    ]

}

