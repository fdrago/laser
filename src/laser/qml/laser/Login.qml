import QtQuick 1.0

Rectangle {
    id: container
    width: 800
    height: 480
    color: "#00ffffff"
    //radius: 2

    signal clicked

    property int idx: -1;
    property string codice: ""


    TextEdit {
        id: codeUser
        x: 360
        y: 50
        width: 280
        height: 69
        color: "#f9f9f9"

        text: codice
        z: 2
        selectionColor: "#040000"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 63
        font.family: myCustomFont.name
    }

    Button {
        id: button1
        x: 43
        y: 252
        width: 80
        height: 80
        text: "7"
        z: 1
        onClicked: codice += text
    }

    Button {
        id: button2
        x: 145
        y: 252
        width: 80
        height: 80
        text: "8"
        z: 1
        onClicked: codice += text
    }

    Button {
        id: button3
        x: 247
        y: 252
        width: 80
        height: 80
        text: "9"
        z: 1
        onClicked: codice += text
    }

    Button {
        id: button4
        x: 43
        y: 143
        width: 80
        height: 80
        text: "4"
        z: 1
        onClicked: codice += text
    }

    Button {
        id: button5
        x: 145
        y: 143
        width: 80
        height: 80
        text: "5"
        z: 1
        onClicked: codice += text
    }

    Button {
        id: button6
        x: 247
        y: 143
        width: 80
        height: 80
        text: "6"
        z: 1
        onClicked: codice += text
    }



    Button {
        id: button7
        x: 43
        y: 45
        width: 80
        height: 80
        text: "1"
        z: 1
        onClicked: codice += text
    }

    Button {
        id: button8
        x: 145
        y: 45
        width: 80
        height: 80
        text: "2"
        z: 1
        onClicked: codice += text
    }

    Button {
        id: button9
        x: 247
        y: 45
        width: 80
        height: 80
        text: "3"
        z: 1
        onClicked: codice += text
    }


    Button {
        id: button10
        x: 43
        y: 355
        width: 80
        height: 80
        text: "0"
        z: 1
        onClicked: codice += text
    }

    Button {
        id: button11
        x: 676
        y: 44
        width: 80
        height: 80
        text: ""
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
        backGround: "../../images/canc.png"
        z: 1
        onClicked: codice=""
    }

    Button {
        id: btnEnter
        x: 145
        y: 355
        width: 182
        height: 80
        text: "Enter"
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
        z: 1
        onClicked:{
            if(idx==-1)
                laserModel.login(codice);
            else {
                laserModel.setPwd(idx,codice);
                main.state = "Config";
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 351
        y: 45
        width: 297
        height: 80
        color: "#cc000000"
        //radius: 8
        z: 1
    }



}
