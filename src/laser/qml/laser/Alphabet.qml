import QtQuick 1.0

Rectangle {
    id: container
    width: 800
    height: 480
    color: "#00ffffff"

    signal clicked

    property int idx:-1;
    property string name: ""


    TextEdit {
        id: nameUser
        x: 89
        y: 35
        width: 546
        height: 69
        color: "#f9f9f9"

        text: name
        z: 2
        selectionColor: "#040000"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 63
        font.family: myCustomFont.name
    }

    Button {
        id: button1
        x: 47
        y: 127
        width: 65
        height: 65
        text: "Q"
        z: 1
        onClicked: name += text
    }


    Button {
        id: button11
        x: 671
        y: 29
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
        onClicked: name=""
    }

    Button {
        id: btnEnter
        x: 569
        y: 385
        width: 182
        height: 65
        text: "Enter"
        z: 1
        onClicked: {
            main.state = "Config";
            laserModel.setName(idx,name);
        }
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
    }

    Rectangle {
        id: rectangle1
        x: 82
        y: 30
        width: 561
        height: 80
        color: "#cc000000"
        z: 1
    }

    Button {
        id: button2
        x: 118
        y: 127
        width: 65
        height: 65
        text: "W"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button3
        x: 189
        y: 127
        width: 65
        height: 65
        text: "E"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button4
        x: 260
        y: 127
        width: 65
        height: 65
        text: "R"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button5
        x: 331
        y: 127
        width: 65
        height: 65
        text: "T"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button6
        x: 402
        y: 127
        width: 65
        height: 65
        text: "Y"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button7
        x: 473
        y: 127
        width: 65
        height: 65
        text: "U"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button8
        x: 544
        y: 127
        width: 65
        height: 65
        text: "I"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button9
        x: 615
        y: 127
        width: 65
        height: 65
        text: "O"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button10
        x: 686
        y: 127
        width: 65
        height: 65
        text: "P"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button12
        x: 89
        y: 208
        width: 65
        height: 65
        text: "A"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button13
        x: 160
        y: 208
        width: 65
        height: 65
        text: "S"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button14
        x: 231
        y: 208
        width: 65
        height: 65
        text: "D"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button15
        x: 302
        y: 208
        width: 65
        height: 65
        text: "F"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button16
        x: 373
        y: 208
        width: 65
        height: 65
        text: "G"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button17
        x: 444
        y: 208
        width: 65
        height: 65
        text: "H"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button18
        x: 515
        y: 208
        width: 65
        height: 65
        text: "J"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button19
        x: 586
        y: 208
        width: 65
        height: 65
        text: "K"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button20
        x: 657
        y: 208
        width: 65
        height: 65
        text: "L"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button22
        x: 160
        y: 286
        width: 65
        height: 65
        text: "Z"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button23
        x: 231
        y: 286
        width: 65
        height: 65
        text: "X"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button24
        x: 302
        y: 286
        width: 65
        height: 65
        text: "C"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button25
        x: 373
        y: 286
        width: 65
        height: 65
        text: "V"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button26
        x: 444
        y: 286
        width: 65
        height: 65
        text: "B"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button27
        x: 515
        y: 286
        width: 65
        height: 65
        text: "N"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button28
        x: 586
        y: 286
        width: 65
        height: 65
        text: "M"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button29
        x: 302
        y: 385
        width: 228
        height: 65
        text: " "
        z: 1
        onClicked: name += text
    }

}

