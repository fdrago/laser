import QtQuick 1.0

Rectangle {

    property date saveDate


    onSaveDateChanged: {
        day.text= (saveDate.getDate() <10) ? "0"+saveDate.getDate() : saveDate.getDate();
        month.text=(saveDate.getMonth() <10) ? "0"+(saveDate.getMonth()+1) : saveDate.getMonth()+1;
        year.text=((saveDate.getFullYear()-2000) <10) ? "0"+(saveDate.getFullYear()-2000) : (saveDate.getFullYear()-2000);
        hours.text=(saveDate.getHours()<10) ? "0"+saveDate.getHours() : saveDate.getHours();
        minutes.text=(saveDate.getMinutes()<10) ? "0"+saveDate.getMinutes() : saveDate.getMinutes();
    }


    width: 800
    height: 320

    //radius:10

    color: "#00b3b3b3"

    Button {
        id: btnShoot
        x: 60
        y: 20
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
        id: btnWater
        x: 440
        y: 20
        width: 300
        height: 80
        icon: "../../images/acquaCambiata.png"
        text: "Clear water"
        onClicked: {
            yesNo2.cmd = "water";
            utility1.state = "Confirm";

        }
    }

    Button {
        id: btnGuide
        x: 440
        y: 120
        width: 300
        height: 80
        text: "Clear guide"
        icon: "../../images/guidePulite.png"
        onClicked: {
            yesNo2.cmd = "guide";
            utility1.state = "Confirm";
        }
    }

    Button {
        id: btnFilter
        x: 440
        y: 220
        width: 300
        height: 80
        text: "Clear filter"
        icon: "../../images/filtroPulito.png"
        onClicked: {
            yesNo2.cmd = "filter";
            utility1.state = "Confirm";
        }
    }
    Button {
        id: btnCut
        x: 60
        y: 120
        width: 300
        height: 80
        visible: (toolbar.fromPause) ? false : true;
        icon: "../../images/cutCont.png"
        iconOff: "../../images/stop.png"
        text: (btnCut.imgstatus) ? "Stop cut" : "Cut contour"
        /*gradient: Gradient {
            GradientStop {
                position: 0
                color: (btnCut.imgstatus) ? "#aaff0000" : "#aaffffff"
            }

            GradientStop {
                position: 1
                color: "#aa000000"
            }
        }*/
        state: (enableButton) ? "" : "Disable";
        onClicked: {
            imgstatus = (imgstatus) ? 0: 1;
            if(imgstatus)
                laserModel.cutContour();
            else
                laserModel.stop();
        }
    }

    YesNo {
        id: yesNo2
        x: -401
        y: 120
    }



    Buttonsmall {
        id: suday
        x: 51
        y: 432
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setDate(saveDate.getDate()+1));
        }
    }

    Buttonsmall {
        id: giuday
        x: 51
        y: 554
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setDate(saveDate.getDate()-1));
        }

    }

    Buttonsmall {
        id: sumonth
        x: 143
        y: 432
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setMonth(saveDate.getMonth()+1));
        }
    }

    Buttonsmall {
        id: giumonth
        x: 143
        y: 554
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setMonth(saveDate.getMonth()-1));
        }
    }

    Buttonsmall {
        id: suyear
        x: 232
        y: 432
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setYear(saveDate.getFullYear()+1));
        }
    }

    Buttonsmall {
        id: giuyear
        x: 232
        y: 554
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setYear(saveDate.getFullYear()-1));
        }
    }

    Buttonsmall {
        id: suhours
        x: 97
        y: 631
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date(saveDate.getTime() + 60*60000);
        }
    }

    Buttonsmall {
        id: giuhours
        x: 97
        y: 753
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date(saveDate.getTime() - 60*60000);
        }
    }

    Buttonsmall {
        id: suminutes
        x: 186
        y: 631
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date(saveDate.getTime() + 60000);
        }
    }

    Buttonsmall {
        id: giuminutes
        x: 186
        y: 753
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date(saveDate.getTime() - 60000);
        }
    }

    Button {
        id: clockButton
        x: 60
        y: 220
        width: 300
        height: 80
        text: "Clock"
        icon: "../../images/log.png"
        onClicked: {
            utility1.state="SetTime"
            saveDate = new Date()
            /*day.text=saveDate.getDate()
            month.text=saveDate.getMonth()
            year.text=saveDate.getFullYear()-2000
            hours.text=saveDate.getHours()
            minutes.text=saveDate.getMinutes()*/
        }
    }

    Button {
        id: buttonsetdatetime
        x: 295
        y: 733
        text: "Set"
        onClicked: {
            utility1.state = ""
            laserModel.setDate(saveDate.getFullYear()-2000,saveDate.getMonth()+1,saveDate.getDate(),saveDate.getHours(),saveDate.getMinutes())
        }
    }

    Text {
        id: text1
        x: 295
        y: 498
        width: 178
        height: 50
        text: qsTr("dd/mm/yy")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 20
    }

    Text {
        id: text2
        x: 295
        y: 697
        width: 178
        height: 50
        text: qsTr("hh/mm")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 20
    }

    Text {
        id: day
        x: 56
        y: 498
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: month
        x: 146
        y: 498
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: year
        x: 237
        y: 498
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text12
        x: 119
        y: 498
        width: 15
        height: 50
        text: qsTr("/")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text13
        x: 208
        y: 498
        width: 15
        height: 50
        text: qsTr("/")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: hours
        x: 102
        y: 697
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: minutes
        x: 192
        y: 697
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text16
        x: 165
        y: 697
        width: 15
        height: 50
        text: qsTr(":")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }


    states: [
        State {
            name: "Confirm"

            PropertyChanges {
                target: btnShoot
                x: 56
                y: 366
            }

            PropertyChanges {
                target: btnWater
                x: 436
                y: 366
            }

            PropertyChanges {
                target: btnGuide
                x: 436
                y: 466
            }

            PropertyChanges {
                target: btnFilter
                x: 436
                y: 566
            }

            PropertyChanges {
                target: btnCut
                x: 56
                y: 466
            }

            PropertyChanges {
                target: yesNo2
                x: 250
                y: 80
            }

            PropertyChanges {
                target: clockButton
                x: 56
                y: 566
            }
        },
        State {
            name: "SetTime"

            PropertyChanges {
                target: btnShoot
                x: 520
                y: 383
            }

            PropertyChanges {
                target: btnWater
                x: 900
                y: 383
            }

            PropertyChanges {
                target: btnGuide
                x: 900
                y: 483
            }

            PropertyChanges {
                target: btnFilter
                x: 900
                y: 583
            }

            PropertyChanges {
                target: btnCut
                x: 520
                y: 483
            }

            PropertyChanges {
                target: clockButton
                x: 520
                y: 583
            }

            PropertyChanges {
                target: suday
                x: 40
                y: 80
            }

            PropertyChanges {
                target: giuday
                x: 40
                y: 210
            }

            PropertyChanges {
                target: sumonth
                x: 132
                y: 80
            }

            PropertyChanges {
                target: giumonth
                x: 132
                y: 210
            }

            PropertyChanges {
                target: suyear
                x: 221
                y: 80
            }

            PropertyChanges {
                target: giuyear
                x: 221
                y: 210
            }

            PropertyChanges {
                target: suhours
                x: 379
                y: 80
            }

            PropertyChanges {
                target: giuhours
                x: 379
                y: 210
            }

            PropertyChanges {
                target: suminutes
                x: 468
                y: 80
            }

            PropertyChanges {
                target: giuminutes
                x: 468
                y: 210
            }

            PropertyChanges {
                target: buttonsetdatetime
                x: 660
                y: 210
                width: 100
                height: 60
            }

            PropertyChanges {
                target: text1
                x: 40
                y: 20
            }

            PropertyChanges {
                target: text2
                x: 379
                y: 20
            }

            PropertyChanges {
                target: day
                x: 45
                y: 150
            }

            PropertyChanges {
                target: month
                x: 135
                y: 150
            }

            PropertyChanges {
                target: year
                x: 226
                y: 150
            }

            PropertyChanges {
                target: text12
                x: 106
                y: 150
            }

            PropertyChanges {
                target: text13
                x: 197
                y: 150
            }

            PropertyChanges {
                target: hours
                x: 384
                y: 150
            }

            PropertyChanges {
                target: minutes
                x: 474
                y: 150
            }

            PropertyChanges {
                target: text16
                x: 447
                y: 150
            }
        }
    ]


}
