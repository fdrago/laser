import QtQuick 1.0

Rectangle {
    width: 800
    height: 480
    color: "transparent"
    //radius: 10

//    property double setPointP: 0
//    property int setPointPset: 0
//    property int setPointH: 0
//    property double setPointTAmb: 0
//    property double setPointTAcqua: 0

    Image {
        x: 20
        y: -29
        width: 300
        height: 300
        sourceSize.width: 717
        sourceSize.height: 548
        source: "../../images/gauge_pressione3.png"
        fillMode: Image.PreserveAspectFit
        Image {
            x: 124
            y: 40
            width: 53
            height: 290
            rotation: -112.5+setPointPset*225/5
            fillMode: Image.PreserveAspectFit
            source: "../../images/lancettaPset.png"
        }
        Image {
            x: 124
            y: 62
            width: 53
            height: 246
            rotation: if(setPointP<=5 && setPointP>0){-112.5+setPointP*225/5} else if (setPointP<0){-112.5} else {112.5}
            fillMode: Image.PreserveAspectFit
            source: "../../images/lancetta2.png"
        }

        Text {
            id: text4
            x: 134
            y: 217
            color: "#ffffff"
            text: setPointP.toFixed(1);
            font.pixelSize: 16
            font.family: myCustomFont.name
        }

        Text {
            id: text5
            x: 134
            y: 238
            color: "#ffffff"
            text: "b"
            font.pixelSize: 16
            font.family: myCustomFont.name
        }
    }


    Image {
        x: 479
        y: -29
        width: 300
        height: 300
        sourceSize.width: 717
        sourceSize.height: 548
        source: "../../images/gauge_umidita3.png"
        fillMode: Image.PreserveAspectFit
        Image {
            x: 124
            y: 62
            width: 53
            height: 246
            rotation: -112.5+setPointH*225/100
            fillMode: Image.PreserveAspectFit
            source: "../../images/lancetta2.png"
        }

        Text {
            id: text3
            x: 134
            y: 217
            color: "#ffffff"
            text: setPointH.toFixed(0)
            font.pixelSize: 16
            font.family: myCustomFont.name
        }

        Text {
            id: text6
            x: 134
            y: 239
            color: "#ffffff"
            text: "%"
            font.pixelSize: 16
            font.family: myCustomFont.name
        }

    }

    Image {
        x: 20
        y: 208
        width: 300
        height: 300
        sourceSize.width: 717
        sourceSize.height: 548
        source: "../../images/gauge_temp_acqua3.png"
        fillMode: Image.PreserveAspectFit
        Image {
            x: 124
            y: 62
            width: 53
            height: 246
            rotation: -112.5+(setPointTAcqua+20)*225/100
            fillMode: Image.PreserveAspectFit
            source: "../../images/lancetta2.png"
        }

        Text {
            id: text2
            x: 136
            y: 219
            color: "#ffffff"
            text: setPointTAcqua.toFixed(1)
            font.pixelSize: 16
            font.family: myCustomFont.name
        }

        Text {
            id: text8
            x: 137
            y: 241
            color: "#ffffff"
            text: "°C"
            font.pixelSize: 16
            font.family: myCustomFont.name
        }
    }

    Image {
        x: 479
        y: 208
        width: 300
        height: 300
        sourceSize.width: 717
        sourceSize.height: 548
        source: "../../images/gauge_temp_amb3.png"
        fillMode: Image.PreserveAspectFit
        Image {
            x: 124
            y: 62
            width: 53
            height: 246
            rotation: -112.5+(setPointTAmb+20)*225/100
            fillMode: Image.PreserveAspectFit
            source: "../../images/lancetta2.png"
        }

        Text {
            id: text1
            x: 132
            y: 219
            color: "#ffffff"
            text: setPointTAmb.toFixed(1)
            font.pixelSize: 16
            font.family: myCustomFont.name
        }

        Text {
            id: text7
            x: 132
            y: 241
            color: "#ffffff"
            text: "°C"
            font.pixelSize: 16
            font.family: myCustomFont.name
        }
    }

    Button {
        id: button1
        x: 350
        y: 142
        width: 100
        height: 75
        text: "-"
        onClicked: laserModel.decPres();
    }

    Button {
        id: button2
        x: 350
        y: 23
        width: 100
        height: 75
        text: "+"
        onClicked: laserModel.incPres();
    }
    Button {
        x: 355
        y: 406
        width: 91
        height: 66
        //radius: 3
        text: ""
        icon: "../../images/clear.png"
        onClicked: main.state="File"
    }
}
