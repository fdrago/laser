import QtQuick 1.0

Rectangle {
    width: 800
    height: 400
    color: "#00757575"
    radius: 10


    property int txtCount:0;

    Rectangle {
        id: rectangle1
        x: 8
        y: 0
        width: 784
        height: 72
        color: "#80ededed"
        radius: 8
    }

    Button {
        id: btnStop
        x: 38
        y: 88
        width: 299
        height: 209
        radius: 5
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
        x: 458
        y: 88
        width: 299
        height: 209
        radius: 5
        icon: "../../images/pause.png"
        text: "Pause"
        imgstatus: 0
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

    Button {
        id: btnLight
        x: 38
        y: 312
        width: 200
        height: 80
        radius: 8
        text: "Light"
        icon: "../../images/luciOff.png"
        iconOff: "../../images/luciOn.png"
        imgstatus: LightSts;
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setLight(sts);
        }
    }

    Button {
        id: btnFan
        x: 306
        y: 312
        width: 200
        height: 80
        text: "Fan"
        icon: "../../images/fanOff.png"
        imgstatus: FanSts
        iconOff: "../../images/fanOn.png"
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setFan(sts);
        }
    }

    Button {
        id: btnPointer
        x: 557
        y: 312
        width: 200
        height: 80
        text: "Pointer"
        icon: "../../images/puntatoriOff.png"
        imgstatus: LaserSts
        iconOff: "../../images/puntatoriOn.png"
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setLaser(sts);
        }
    }

    Text {
        x: 114
        y: 12
        width: 223
        text: txtTime
        horizontalAlignment: Text.AlignRight
        font.bold: false
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        x: 515
        y: 12
        width: 242
        text: txtCount
        font.bold: false
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 40
        font.family: myCustomFont.name
    }

    Text {
        x: 458
        y: 17
        text: qsTr("Count")
        font.pixelSize: 30
        font.family: myCustomFont.name
    }

    Text {
        x: 38
        y: 17
        text: qsTr("Time")
        font.pixelSize: 30
        font.family: myCustomFont.name
    }

}

