import QtQuick 1.0

Rectangle {
    width: 700
    height: 400

    radius:10

    color: "#00b2b2b2"

    Button {
        id: btnTest
        x: 34
        y: 32
        width: 300
        height: 80
        visible: (toolbar.fromPause) ? false : true;
        icon: "../../images/test.png"
        text: "Test"
        onClicked: {
            laserModel.test();
        }
    }

    Button {
        id: btnShoot
        x: 34
        y: 141
        width: 300
        height: 80
        visible: (toolbar.fromPause) ? false : true;
        icon: "../../images/shoot.png"
        text: "Shoot"
        state: (enableButton) ? "" : "Disable";
        onClicked: {
            laserModel.shoot();
        }
    }

    Button {
        id: btnCut
        x: 34
        y: 249
        width: 300
        height: 80
        visible: (toolbar.fromPause) ? false : true;
        icon: "../../images/cutCont.png"
        iconOff: "../../images/stop.png"
        text: (btnCut.imgstatus) ? "Stop cut" : "Cut contour"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: (btnCut.imgstatus) ? "#aaff0000" : "#aaffffff"
            }

            GradientStop {
                position: 1
                color: "#aa000000"
            }
        }
        state: (enableButton) ? "" : "Disable";
        onClicked: {
            imgstatus = (imgstatus) ? 0: 1;
            if(imgstatus)
                laserModel.cutContour();
            else
                laserModel.stop();
        }
    }

    Button {
        id: btnLight
        x: 371
        y: 32
        width: 300
        height: 80
        icon: "../../images/luciOff.png"
        iconOff: "../../images/luciOn.png"
        text: "Light"
        imgstatus: uLightSts;
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setLight(sts);
        }
    }

    Button {
        id: ubtnFan
        x: 371
        y: 141
        width: 300
        height: 80
        icon: "../../images/fanOff.png"
        iconOff: "../../images/fanOn.png"
        text: "Fan"
        imgstatus: uFanSts
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setFan(sts);
        }
    }

    Button {
        id: ubtnPointer
        x: 371
        y: 249
        width: 300
        height: 80
        text: "Pointer"
        icon: "../../images/puntatoriOff.png"
        iconOff: "../../images/puntatoriOn.png"
        imgstatus: uLaserSts
        onClicked: {
            var sts = (imgstatus) ? 0 : 1;
            laserModel.setLaser(sts);
        }
    }


}
