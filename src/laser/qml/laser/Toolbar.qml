import QtQuick 1.0

Rectangle {
    id: toolbar
    width: 800
    height: 75
    color: "#00000000"
    opacity: 0.8


    Button {
        id: btnLogin
        x: 8
        y: 8
        width: 100
        height: 59
        text: "Login";
        state: ((main.state=="Login") || (main.state=="StopResume") || (!main.enablePassword)) ? "Disable" : "";
        onClicked: {
            login.idx = -1;
            laserModel.stopTimerLaser();
            main.state = "Login"
        }
        visible: (userlevel < 9) ? true : false;

    }

    Button {
        id: btnLogout
        x: 8
        y: 8
        width: 100
        height: 59
        text: "Logout"
        state: ((main.state=="Login") || (main.state=="StopResume") || (!main.enablePassword)) ? "Disable" : "";
        onClicked: {
            laserModel.stopTimerLaser();
            laserModel.login("0000")
            main.state = "File"
        }
        visible: (userlevel > 9) ? true : false;
    }

    Button {
        id: btnFile
        x: 114
        y: 8
        width: 100
        height: 59
        //radius: 8
        text: "File"
        state: ((main.state=="File") || (main.state=="WaitList") || (main.state=="Choose") || (main.state=="StopResume")) ? "Disable" : "";
        onClicked: {
            main.state = "File";
        }
    }

    Button {
        id: btnUtility
        x: 220
        y: 8
        width: 100
        height: 59
        text: "Utility"
        state: ((main.state=="Utility") || (main.state=="StopResume")) ? "Disable" : "";
        onClicked: {
            main.state = "Utility";
        }
    }

    Button {
        id: btnConfig
        x: 326
        y: 8
        width: 100
        height: 59
        visible: (userlevel > 9) ? true : false;
        text: "Config"
        state: ((main.state=="Config") || (main.state=="StopResume")) ? "Disable" : "";
        onClicked: {
            main.state = "Config";
        }
    }

    Text {
        x: 687
        y: 8
        width: 105
        height: 20
        text: username
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 18
        font.family: myCustomFont.name
    }

    Text {
        x: 691
        y: 34
        width: 101
        height: 20
        text: usertime
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 18
        font.family: myCustomFont.name
    }

    Text {
        x: 769
        y: 60
        width: 31
        height: 20
        text: userlevel
        font.pixelSize: 18
        visible: false;
        font.family: myCustomFont.name
    }

    Image {
        id: tAmb
        x: 444
        y: 0
        width: 50
        height: 50
        source: "../../images/tempAmbiente.png"
    }

    Image {
        id: tAcq
        x: 514
        y: 0
        width: 50
        height: 50
        source: "../../images/tempAcqua.png"
    }

    Image {
        id: tHum
        x: 584
        y: 0
        width: 50
        height: 50
        source: "../../images/umidita.png"
    }

    Text {
        x: 449
        y: 50
        width: 40
        height: 17
        text: txtAmb.toFixed(1) + " °C"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
        font.family: myCustomFont.name
    }

    Text {
        x: 519
        y: 50
        width: 40
        height: 17
        text: txtAcq.toFixed(1) + " °C"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
        font.family: myCustomFont.name
    }

    Text {
        x: 589
        y: 50
        width: 40
        height: 17
        text: txtHum.toFixed(0) + " %"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
        font.family: myCustomFont.name
    }

    Image {
        id: tPres
        x: 655
        y: 0
        width: 50
        height: 50
        source: "../../images/aria.png"
    }

    Text {
        x: 660
        y: 50
        width: 40
        height: 17
        text: txtAir.toFixed(1) + " b"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
        font.family: myCustomFont.name
    }

    MouseArea {
        id: mouseArea1
        x: 439
        y: 0
        width: 261
        height: 60
        onClicked: main.state = "Gauges"
    }

}
