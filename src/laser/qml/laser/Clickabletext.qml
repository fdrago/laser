import QtQuick 1.0


Rectangle {

    property int valueid
    property string value
    property string disabledvalue
    property bool disablednonc

    width: 70
    height: 25
    color: "#ffffff"

    Text {
        id: text1
        x: 0
        y: 0
        width: 70
        height: 25
        text: value
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
    }

    MouseArea {
        id: mouseArea1
        x: 0
        y: 0
        width: 70
        height: 25
        onClicked: {
            login.edx = valueid;
            login.idx =-1;
            main.state = "Login";
        }
    }
}
