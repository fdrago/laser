import QtQuick 1.0


Rectangle {
    id: main
    width: 800
    height: 480
    color: "#4cafe6"

    property int enableButton:1;
    property int valoreNuovo: 0;

    Connections{
        target: laserModel
        property int txtCount: 0
        property string txtTime: "0:00:00"

        onTxtTimeChanged: {
            stopPauseResume1.txtTimeDisplay = txtTime
            console.log()<<"txtTime: "<<txtTime
        }
    }





    FontLoader {
        id: myCustomFont;
        source: "../fonts/Ubuntu-R.ttf"
    }

    onValoreNuovoChanged: {
        config1.valueup = (config1.valueup==0)? 1 : 0;
    }

    onStateChanged: {
        gauges1.aggiorna = (gauges1.aggiorna==true)? false : true
        console.log(gauges1.aggiorna)
    }

    Connections {
        target: laserModel;

        onStateChanged: {
            var ts = main.state;

            if(main.state=="StopResume" && newState=="Alarm"){
                stopPauseResume1.state="Alarm";
            }
            else{
                main.state= newState;
                stopPauseResume1.state="";
            }

            if((ts != "Alarm") && (newState == "Alarm"))
                laserModel.setStatus(ts);
            else if (ts != "Alarm")
                laserModel.setStatus("");

            console.log("new qml state", newState);

        }

        onEnableButton: {
            enableButton = eb;
        }

        onAllarme: {

            if ( alarm == 1 || alarm == 0 || alarm == 2)
                toolbarBottom1.spiaSportelloVis  = stato == false ? false : true
            else
                toolbarBottom1.spiaSportelloVis = false
            if ( alarm == 99)
                toolbarBottom1.spiaLaserVis  = stato == false ? false : true
            else
                toolbarBottom1.spiaLaserVis = false
            if ( alarm == 5)
                toolbarBottom1.spiaFuocoVis  = stato == false ? false : true
            else
                toolbarBottom1.spiaFuocoVis = false
            if ( alarm == 100)
                toolbarBottom1.spiaSicurezzeVis  = stato == false ? false : true
            else
                toolbarBottom1.spiaSicurezzeVis = false
        }
    }

    Image {
        id: sfondo
        x: 0
        y: 0
        width: 800
        height: 480
        source: "../../images/sfondoBoot.png"

        Text {
            id: norme1
            x: 342
            y: 32
            color: "#f6f6f6"
            text: qsTr("Norme d'uso")
            font.pixelSize: 21
        }

        Text {
            id: norme2
            x: 60
            y: 95
            width: 680
            height: 322
            color: "#f3ecec"
            text: qsTr("Dictumst sit nunc lorem auctor porttitor lacus non! Ultricies, mattis pulvinar lectus, ut adipiscing? Nunc sit mauris dapibus! Cum tristique et et penatibus phasellus, odio ut amet mus odio et, parturient amet, turpis turpis non, sit! Elementum nunc pulvinar pulvinar nunc platea! Adipiscing pulvinar, ut. Placerat rhoncus mid, porttitor turpis odio in phasellus nisi, ultricies non! Magna velit enim lundium, nisi enim aliquet urna, magnis mus, a pid proin sit auctor sed, dolor ridiculus habitasse! Parturient rhoncus tincidunt! Facilisis mattis rhoncus dis adipiscing dis, mattis aliquam proin, et scelerisque massa, tincidunt, lundium! Integer montes. Vel aliquet sagittis etiam et rhoncus, scelerisque egestas, urna ac tristique massa. Placerat augue, magna cum sed habitasse mauris dictumst a enim sagittis nunc platea phasellus.")
            wrapMode: Text.WordWrap
            textFormat: Text.PlainText
            font.pixelSize: 20
        }

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            onPressed: {
                if(main.state!="waitList"){
                    laserModel.login( "guest" )
                }
            }
        }


        Image {
            id: image2
            x: 264
            y: 114
            width: 272
            height: 252
            visible: false
            fillMode: Image.PreserveAspectFit
            source: "../../images/path3400.png"
        }
    }

    Toolbar {
        id: toolbar
        x: 0
        y: -81
    }
    MouseArea {
        id: areaToAbout
        x: 1228
        y: 380
        width: 100
        height: 100
        z: 100
        onPressed: {
            main.state = "About"
        }
    }

    About {
        id: about
        x: -337
        y: 140
        color: "#f0b3b3b3"
        onClicked: {
            if (main.state == "WaitList"){}
            else main.state = "Login"
        }
    }

    Joystick {
        id: joystick
        x: 800
        y: 80

    }
    FileChoose {
        id: fileChoose
        x: 806
        y: 80
    }

    StartStopTest {
        id: startStopTest
        x: -406
        y: 80
    }


    Login {
        id: login
        x: 318
        y: 209
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 0
        onClicked: {
            if (main.state != "WaitList"){
                main.state = "File"
            }
        }
    }

    Utility {
        id: utility1
        x: 50
        y: 486
    }

    Alarm {
        id: alarm1
        x: 0
        y: -406
    }

    Config {
        id: config1
        x: -145
        y: 1246
    }

    Alphabet {
        id: alphabet1
        x: -816
        y: 0
    }

    StopPauseResume {
        id: stopPauseResume1
        x: 0
        y: 480
    }

    FileUpload {
        id: fileUpload1
        x: 0
        y: -487
    }

    Gauges {
        id: gauges1
        x: 836
        y: -555
    }

    Text {
        id: logintitle
        x: 277
        y: 8
        width: 247
        height: 71
        color: "#000000"
        text: qsTr("Login Utente")
        visible: false
        font.bold: true
        style: Text.Normal
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 21
    }

    Text {
        id: passatag
        x: 191
        y: 365
        width: 418
        height: 51
        color: "#ffffff"
        text: qsTr("Passare tag per identificazione")
        visible: false
        style: Text.Normal
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    Text {
        id: logged
        x: 0
        y: 215
        width: 400
        height: 50
        color: "#ffffff"
        text: qsTr("Logged: ")
        visible: false
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 30
    }

    Text {
        id: utente
        x: 400
        y: 215
        width: 400
        height: 50
        color: "#ffffff"
        text: qsTr("Utente")
        visible: false
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 30
    }

    Text {
        id: text1
        x: -660
        y: -233
        text: qsTr("Text")
        opacity: 0
        font.pixelSize: 12
    }

    Button {
        id: button1
        x: -650
        y: -319
        text: "Single User"
    }

    Button {
        id: button2
        x: -400
        y: -319
        text: "Multi User"
    }

    Text {
        id: text2
        x: -824
        y: -417
        width: 400
        height: 50
        text: qsTr("Mode: ")
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
    }

    Text {
        id: text3
        x: -425
        y: -417
        width: 400
        height: 50
        text: qsTr("Modalità")
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
    }

    Button {
        id: button3
        x: -522
        y: -217
        text: "Back"
    }

    Rectangle {
        id: rectangle1
        x: 301
        y: 140
        width: 200
        height: 200
        color: "#ffffff"
        opacity: 0

        Text {
            id: text4
            x: 0
            y: 0
            text: qsTr("Text")
            opacity: 0
            font.pixelSize: 12
        }
    }

    ToolbarBottom {
        id: toolbarBottom1
        x: 1
        y: -161


    }






    states: [
        State {
            name: "About"

            PropertyChanges {
                target: about
                x: 250
                y: 140
            }

            PropertyChanges {
                target: startStopTest
                x: -406
                y: 80
            }

            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoBoot.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }

        },
        State {
            name: "File"
            PropertyChanges {
                target: startStopTest
                x: 0
                y: 80
                btnListText: "List"
            }
            PropertyChanges {
                target: toolbar
                x: 0
                y: 0
            }

            PropertyChanges {
                target: startStopTest
                x: 0
                y: 80
            }

            PropertyChanges {
                target: fileChoose
                x: 806
                y: 80
            }

            PropertyChanges {
                target: joystick
                x: 300
                y: 81

            }

            PropertyChanges {
                target: light
                x: -406
                y: 80
            }

            PropertyChanges {
                target: about
                x: -359
                y: 80
            }

            PropertyChanges {
                target: areaToAbout
                x: 700
                y: 480
            }

            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoFile.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }

            PropertyChanges {
                target: main
                color: "#55b2de"
            }

            PropertyChanges {
                target: item1
             //   opacity: 1
            }

            PropertyChanges {
                target: rectangle1
                x: 200
                y: 140
                width: 400
                color: "#32ff9d"
                z: -1
                opacity: 1
            }

            PropertyChanges {
                target: text4
                x: 73
                y: 62
                width: 254
                height: 76
                text: qsTr("Loading")
                z: 102
                wrapMode: "NoWrap"
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
                font.pixelSize: 30
                opacity: 1
            }

            PropertyChanges {
                target: toolbarBottom1
                x: 0
                y: 405
                opacity: 1
            }
        },
        State {
            name: "Login"

            PropertyChanges {
                target: login
                x: 0
                y: 0
                opacity: 1
                codice: ""
            }

            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoLogin.png"
            }

            PropertyChanges {
                target: areaToAbout
                x: 422
                y: 181
                width: 261
                height: 137
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }
        },
        State {
            name: "Choose"

            PropertyChanges {
                target: startStopTest
                x: 0
                y: 75
                btnListText: "Joypad"
            }
            PropertyChanges {
                target: toolbar
                x: 0
                y: 0
            }

            PropertyChanges {
                target: startStopTest
                x: 0
                y: 80
            }

            PropertyChanges {
                target: fileChoose
                x: 400
                y: 80
            }

            PropertyChanges {
                target: areaToAbout
                x: 700
                y: 480
            }

            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoFile.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }

            PropertyChanges {
                target: main
                color: "#4eb5e4"
            }

            PropertyChanges {
                target: toolbarBottom1
                x: 0
                y: 405
            }

            PropertyChanges {
                target: stopPauseResume1
                color: "#4cb5e6"
            }
        },
        State {
            name: "Utility"
            PropertyChanges {
                target: toolbar
                x: 0
                y: 0
            }

            PropertyChanges {
                target: startStopTest
                x: -406
                y: 80
            }

            PropertyChanges {
                target: utility1
                x: 0
                y: 80
            }

            PropertyChanges {
                target: areaToAbout
                x: 700
                y: 480
            }

            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoUtility.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }

            PropertyChanges {
                target: toolbarBottom1
                x: 0
                y: 405
            }
        },
        State {
            name: "Alarm"

            PropertyChanges {
                target: alarm1
                x: 0
                y: 40
            }

            PropertyChanges {
                target: areaToAbout
                x: 806
                y: 486
            }
            PropertyChanges {
                target: sfondo
                source: (typeAlarm==1) ? "../../images/sfondoAlarm.png" : "../../images/sfondoAlert.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }

            PropertyChanges {
                target: stopPauseResume1
                x: 1
                y: 480
            }
        },
        State {
            name: "Username"

            PropertyChanges {
                target: alphabet1
                x: 0
                y: 0
                width: 800
                height: 480
            }

            PropertyChanges {
                target: areaToAbout
                x: 800
                y: 486
            }
            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoConfig.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }
        },
        State {
            name: "Config"

            PropertyChanges {
                target: config1
                x: 0
                y: 80
                color: "#00b3b3b3"
            }

            PropertyChanges {
                target: toolbar
                x: 0
                y: 0
            }

            PropertyChanges {
                target: areaToAbout
                x: 800
                y: 486
            }
            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoConfig.png"
            }

            PropertyChanges {
                target: mouseArea1
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: main
                color: "#59b2da"
            }

            PropertyChanges {
                target: toolbarBottom1
                x: 0
                y: 405
            }
        },
        State {
            name: "StopResume"
            PropertyChanges {
                target: startStopTest
                x: -400
                btnListText: "List"
            }

            PropertyChanges {
                target: fileChoose
                x: 806
            }

            PropertyChanges {
                target: joystick
                x: 800
            }

            PropertyChanges {
                target: stopPauseResume1
                x: 0
                y: 80
            }

            PropertyChanges {
                target: toolbar
                y: 0
            }
            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoFile.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }

            PropertyChanges {
                target: text1
                opacity: 1
            }

            PropertyChanges {
                target: fileUpload1
                x: -160
                y: -613
            }

            PropertyChanges {
                target: main
                color: "#55b5de"
            }

            PropertyChanges {
                target: toolbarBottom1
                x: 0
                y: 405
            }
        },
        State {
            name: "FileUpload"
            PropertyChanges {
                target: toolbar
                x: 0
                y: 0
            }
            PropertyChanges {
                target: areaToAbout
                x: 806
                y: 486
            }

            PropertyChanges {
                target: fileUpload1
                x: 0
                y: 80
            }
            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoFile.png"
            }

            PropertyChanges {
                target: mouseArea1
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: norme1
                color: "#f5f5f5"
                visible: false
            }

            PropertyChanges {
                target: alarm1
                color: "#00b3b3b3"
            }

            PropertyChanges {
                target: utility1
                color: "#00b3b3b3"
            }

            PropertyChanges {
                target: main
                color: "#55b3de"
            }

            PropertyChanges {
                target: toolbarBottom1
                x: 0
                y: 405
            }
        },
        State {
            name: "Gauges"

            PropertyChanges {
                target: gauges1
                x: 0
                y: 0
            }
            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoUtility.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                visible: false
            }
        },
        State {
            name: "Login RFID"

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoLogin.png"
            }


            PropertyChanges {
                target: logintitle
                x: 0
                y: 30
                width: 800
                height: 32
                color: "#000000"
                text: qsTr("Login Utente")
                visible: true
                font.bold: true
                textFormat: Text.AutoText
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
            }

            PropertyChanges {
                target: sfondo
                x: 0
                y: 0
            }

            PropertyChanges {
                target: joystick
                x: 800
                y: 80
            }

            PropertyChanges {
                target: fileChoose
                x: 806
                y: 80
            }

            PropertyChanges {
                target: stopPauseResume1
                x: 0
                y: 480
            }

            PropertyChanges {
                target: mouseArea1
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
            }

            PropertyChanges {
                target: image1
                x: 275
                y: 151
                width: 250
                height: 178
                //antialiasing: false
                visible: true
                fillMode: Image.PreserveAspectFit
                source: "../../../../../../Pictures/path3400.png"
                opacity: 1
            }

            PropertyChanges {
                target: passatag
                x: 0
                y: 365
                width: 800
                height: 44
                text: qsTr("Use tag for identification")
                visible: true
            }

            PropertyChanges {
                target: image2
                visible: true
            }
        },
        State {
            name: "Logged"
            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoLogin.png"
            }

            PropertyChanges {
                target: logintitle
                x: 0
                y: 30
                width: 800
                height: 32
                color: "#000000"
                text: qsTr("Login Utente")
                verticalAlignment: Text.AlignVCenter
                textFormat: Text.AutoText
                font.pixelSize: 21
                wrapMode: Text.NoWrap
                font.bold: true
                visible: true
                horizontalAlignment: Text.AlignHCenter
            }

            PropertyChanges {
                target: sfondo
                x: 0
                y: 0
            }

            PropertyChanges {
                target: joystick
                x: 800
                y: 80
            }

            PropertyChanges {
                target: fileChoose
                x: 806
                y: 80
            }

            PropertyChanges {
                target: stopPauseResume1
                x: 0
                y: 480
            }

            PropertyChanges {
                target: mouseArea1
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
            }

            PropertyChanges {
                target: image1
                x: 275
                y: 151
                width: 250
                height: 178
                source: "../../../../../../Pictures/path3400.png"
                opacity: 1
                fillMode: Image.PreserveAspectFit
                visible: true
                //antialiasing: false
            }

            PropertyChanges {
                target: passatag
                x: 0
                y: 365
                width: 800
                height: 44
                visible: false
            }

            PropertyChanges {
                target: image2
                visible: false
            }

            PropertyChanges {
                target: logged
                visible: true
            }

            PropertyChanges {
                target: utente
                visible: true
            }
        },
        State {
            name: "WaitList"
            PropertyChanges {
                target: startStopTest
                x: 0
                y: 80
                btnListText: "List"
            }

            PropertyChanges {
                target: toolbar
                x: 0
                y: 0
            }

            PropertyChanges {
                target: startStopTest
                x: 0
                y: 80
            }



            PropertyChanges {
                target: fileChoose
                x: 400
                y: 80
            }

            PropertyChanges {
                target: light
                x: "-406"
                y: 80
            }

            PropertyChanges {
                target: about
                x: "-359"
                y: 80
            }

            PropertyChanges {
                target: areaToAbout
                x: 700
                y: 480
            }

            PropertyChanges {
                target: sfondo
                source: "../../images/sfondoFile.png"
            }

            PropertyChanges {
                target: norme1
                visible: false
            }

            PropertyChanges {
                target: norme2
                visible: false
            }

            PropertyChanges {
                target: mouseArea1
                z: 1
                visible: false
            }

            PropertyChanges {
                target: main
                color: "#4cb5e6"
            }

            PropertyChanges {
                target: item1
                opacity: 1
            }

            PropertyChanges {
                target: rectangle1
                x: 200
                y: 140
                width: 400
                color: "#32ff9d"
                opacity: 1
                z: "+1"
            }

            PropertyChanges {
                target: text4
                x: 73
                y: 62
                width: 254
                height: 76
                text: qsTr("Loading")
                opacity: 1
                wrapMode: "NoWrap"
                z: 102
                font.pixelSize: 30
                verticalAlignment: "AlignVCenter"
                horizontalAlignment: "AlignHCenter"
            }

            PropertyChanges {
                target: toolbarBottom1
                x: 0
                y: 405
            }
        }
    ]

    /*transitions: [
        Transition {
            from: "*"; to: "*"
            NumberAnimation { properties: "y"; easing.type: Easing.InOutQuad; duration: 500 }
            NumberAnimation { properties: "x"; easing.type: Easing.InOutQuad; duration: 500 }
        }

    ]*/

}
