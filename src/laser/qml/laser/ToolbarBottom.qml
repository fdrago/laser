import QtQuick 1.0

Rectangle {
    id: toolbar
    width: 800
    height: 75
    color: "#00000000"
    opacity: 0.8

    property bool spiaSportelloVis : false
    property bool spiaLaserVis: false
    property bool spiaFuocoVis: false
    property bool spiaSicurezzeVis: false

    Button {
        id: btnLight
        x: 220
        y: 8
        width: 100
        height: 59
        //text: "Light"
        icon: "../../images/luciOff.png"
        iconOff: "../../images/luciOn.png"
        imgstatus: uLightSts
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setLight(sts);
        }
    }

    Button {
        id: ubtnFan
        x: 114
        y: 8
        width: 100
        height: 59
        //text: "Fan"
        icon: "../../images/fanOff.png"
        iconOff: "../../images/fanOn.png"
        imgstatus: uFanSts
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setFan(sts);
        }
    }

    Button {
        id: ubtnPointer
        x: 8
        y: 8
        width: 100
        height: 59
        //text: "Pointer"
        icon: "../../images/puntatoriOff.png"
        iconOff: "../../images/puntatoriOn.png"
        imgstatus: uLaserSts
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setLaser(sts);
        }
    }

    Image {
        id: spiaSportello
        x: 725
        y: 0
        height: 75
        width: 75
        source: "../../images/spia_sportello.png"
        fillMode: Image.PreserveAspectFit
        visible: spiaSportelloVis
    }
    Image {
        id: spiaLaser
        x: 650
        y: 0
        width: 75
        height: 75
        source: "../../images/spia_laserOn.png"
        fillMode: Image.PreserveAspectFit
        visible: spiaLaserVis
    }
    Image {
        id: spiaFuoco
        x: 575
        y: 0
        width: 75
        height: 75
        source: "../../images/spia_fuoco.png"
        fillMode: Image.PreserveAspectFit
        visible: spiaFuocoVis
    }
    Image {
        id: spiaSicurezze
        x: 500
        y: 0
        width: 75
        height: 75
        source: "../../images/spia_sicurezzeOff.png"
        fillMode: Image.PreserveAspectFit
        visible: spiaSicurezzeVis
    }

    Button {
        id: btnFiltro
        x: 326
        y: 8
        width: 100
        height: 59
        icon: "../../images/luciOff.png"
        iconOff: "../../images/luciOn.png"
        imgstatus: uLightSts
    }

}
