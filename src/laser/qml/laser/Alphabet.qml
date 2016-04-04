import QtQuick 1.0

Rectangle {
    id: container
    width: 800
    height: 480
    color: "#00ffffff"
    radius: 2

    signal clicked

    property int idx:-1;
    property string name: ""


    TextEdit {
        id: nameUser
        x: 84
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
        x: 42
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "Q"
        z: 1
        onClicked: name += text
    }


    Button {
        id: button11
        x: 666
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
        x: 605
        y: 392
        width: 182
        height: 80
        text: "Enter"
        z: 1
        onClicked: {
            main.state = "Config";
            laserModel.setName(idx,name);
        }
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
    }

    Rectangle {
        id: rectangle1
        x: 77
        y: 30
        width: 561
        height: 80
        color: "#cc000000"
        radius: 8
        z: 1
    }

    Button {
        id: button2
        x: 113
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "W"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button3
        x: 184
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "E"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button4
        x: 255
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "R"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button5
        x: 326
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "T"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button6
        x: 397
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "Y"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button7
        x: 468
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "U"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button8
        x: 539
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "I"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button9
        x: 610
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "O"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button10
        x: 681
        y: 127
        width: 65
        height: 65
        radius: 3
        text: "P"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button12
        x: 84
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "A"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button13
        x: 155
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "S"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button14
        x: 226
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "D"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button15
        x: 297
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "F"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button16
        x: 368
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "G"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button17
        x: 439
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "H"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button18
        x: 510
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "J"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button19
        x: 581
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "K"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button20
        x: 652
        y: 208
        width: 65
        height: 65
        radius: 3
        text: "L"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button22
        x: 155
        y: 286
        width: 65
        height: 65
        radius: 3
        text: "Z"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button23
        x: 226
        y: 286
        width: 65
        height: 65
        radius: 3
        text: "X"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button24
        x: 297
        y: 286
        width: 65
        height: 65
        radius: 3
        text: "C"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button25
        x: 368
        y: 286
        width: 65
        height: 65
        radius: 3
        text: "V"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button26
        x: 439
        y: 286
        width: 65
        height: 65
        radius: 3
        text: "B"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button27
        x: 510
        y: 286
        width: 65
        height: 65
        radius: 3
        text: "N"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button28
        x: 581
        y: 286
        width: 65
        height: 65
        radius: 3
        text: "M"
        z: 1
        onClicked: name += text
    }

    Button {
        id: button29
        x: 297
        y: 385
        width: 228
        height: 65
        radius: 3
        text: " "
        z: 1
        onClicked: name += text
    }

}
