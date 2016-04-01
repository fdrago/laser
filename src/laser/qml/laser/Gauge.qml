import QtQuick 1.0

Image {
    property int setPoint: 0
    property string backGround: ""
    x: 0
    y: 0
    width: 300
    height: 240
    sourceSize.height: 548
    sourceSize.width: 717
    fillMode: Image.PreserveAspectFit
    source: backGround
    Image {
        x: 124
        y: 32
        width: 53
        height: 246
        rotation: -112.5+setPoint*0.35*225/2.5
        fillMode: Image.PreserveAspectFit
        source: "../../images/lancetta.png"
    }
}

