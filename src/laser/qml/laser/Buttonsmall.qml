import QtQuick 1.0

Rectangle  {
    id: container

    property string text: "Button"
    property string backGround: ""
    property string icon:""
    property string iconOff:""

    property int imgstatus:0

    signal pressed
    signal relased
    signal clicked

    width: 60
    height: 60

    border  { width: 1; color: "Black" }
    smooth: true
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#aaffffff"
        }

        GradientStop {
            position: 1
            color: "#aa000000"
        }
    }

    Image {
        id: imgIcon
        x: 10
        y: 10
        width: 40
        height: 40
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        source: (imgstatus) ? iconOff : icon;
        fillMode: Image.PreserveAspectFit
        anchors.leftMargin: 15
        anchors.topMargin: 10
    }

    Image {
        id: imgBack
        x: 0
        y: 0
        width: 60
        height: 60
        visible: true
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.fill: parent
        source: backGround
    }
    // color the button with a gradient

    MouseArea  {
        id: mouseArea
        width: 60
        height: 60
        anchors.bottomMargin: 0
        anchors.leftMargin: 1
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.fill: parent
        onClicked: {
            container.clicked();
        }

        onPressed: {
            container.pressed();
        }

        onReleased: {
            container.relased();
        }

    }

    states: [
        State {
            name: "Disable"

            PropertyChanges {
                target: mouseArea
                enabled: false
            }
        }
    ]
}


