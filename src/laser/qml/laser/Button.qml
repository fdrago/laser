import QtQuick 1.0

Rectangle  {
    id: container

    property string text: ""
    property string backGround: ""
    property string icon:""
    property string iconOff:""
    property int textsize: 24

    property int imgstatus:0

    signal pressed
    signal relased
    signal clicked

    width: 80
    height: 80

    border  { width: 1; color: "Black" }
    smooth: true
    gradient: Gradient {
        GradientStop {
            id: gradientStop1
            position: 0
            color: "#ffffff"
        }

        GradientStop {
            id: gradientStop2
            position: 1
            color: "#aa000000"
        }
    }

    Image {
        id: imgBack
        x: 0
        y: 0
        anchors.fill: parent
        source: backGround
    }

    Image {
        id: imgIcon
        anchors.leftMargin: 0
        x: (buttonLabel.text != "") ? 15 : ((container.width-imgIcon.width)/2)
        y: 0
        //width: (parent.width > 200) ? 80 : 60;
        height: (parent.width > 200) ? 80 : 60;
        anchors.verticalCenter: parent.verticalCenter
        source: (imgstatus) ? iconOff : icon;
        fillMode: Image.PreserveAspectFit
    }

    Text  {
        id: buttonLabel
        color: "white"
        text: container.text
        x: (imgIcon.width==0) ? 0 : (imgIcon.width + 2*imgIcon.x)
        y: 0
        width: (imgIcon.width==0) ? parent.width : (parent.width - 2*imgIcon.x -imgIcon.width)
        height: parent.height
        clip: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: textsize
        font.family: myCustomFont.name
    }
    // color the button with a gradient

    MouseArea  {
        id: mouseArea
        anchors.fill: parent
        //width: 184
        onClicked: {
            container.clicked();
        }

        onPressed: {
            container.pressed();
            //container.state= "Pressed";
        }

        onReleased: {
            container.relased();
            //container.state= "";
        }

    }
    states: [
        State {
            name: "Disable"

            PropertyChanges {
                target: mouseArea
                enabled: false
            }

            PropertyChanges {
                target: buttonLabel
                color: "#6e6e6e"
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: mouseArea
                enabled: false
            }

            PropertyChanges {
                target: buttonLabel
                color: "#6e6e6e"
            }

            PropertyChanges {
                target: gradientStop1
                color: "#aaffffff"
            }

            PropertyChanges {
                target: gradientStop2
                color: "#ff0000"
            }

            PropertyChanges {
                target: container
            }
        }
    ]

}
