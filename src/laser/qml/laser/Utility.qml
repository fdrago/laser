import QtQuick 1.0

Rectangle {

    property date saveDate


    onSaveDateChanged: {
        day.text= (saveDate.getDate() <10) ? "0"+saveDate.getDate() : saveDate.getDate();
        month.text=(saveDate.getMonth() <9) ? "0"+(saveDate.getMonth()+1) : saveDate.getMonth()+1;
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
        x: 46
        y: 595
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setDate(saveDate.getDate()+1));
        }
    }

    Buttonsmall {
        id: giuday
        x: 46
        y: 717
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setDate(saveDate.getDate()-1));
        }

    }

    Buttonsmall {
        id: sumonth
        x: 138
        y: 595
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setMonth(saveDate.getMonth()+1));
        }
    }

    Buttonsmall {
        id: giumonth
        x: 138
        y: 717
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setMonth(saveDate.getMonth()-1));
        }
    }

    Buttonsmall {
        id: suyear
        x: 227
        y: 595
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setYear(saveDate.getFullYear()+1));
        }
    }

    Buttonsmall {
        id: giuyear
        x: 227
        y: 717
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date( new Date(saveDate).setYear(saveDate.getFullYear()-1));
        }
    }

    Buttonsmall {
        id: suhours
        x: 92
        y: 794
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date(saveDate.getTime() + 60*60000);
        }
    }

    Buttonsmall {
        id: giuhours
        x: 92
        y: 916
        icon: "../../images/giu.png"
        onClicked: {
            saveDate = new Date(saveDate.getTime() - 60*60000);
        }
    }

    Buttonsmall {
        id: suminutes
        x: 181
        y: 794
        icon: "../../images/su.png"
        onClicked: {
            saveDate = new Date(saveDate.getTime() + 60000);
        }
    }

    Buttonsmall {
        id: giuminutes
        x: 181
        y: 916
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
        x: 290
        y: 896
        text: "Set"
        onClicked: {
            utility1.state = ""
            laserModel.setDate(saveDate.getFullYear()-2000,saveDate.getMonth()+1,saveDate.getDate(),saveDate.getHours(),saveDate.getMinutes())
        }
    }

    Text {
        id: text1
        x: 290
        y: 661
        width: 178
        height: 50
        text: qsTr("dd/mm/yy")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 20
    }

    Text {
        id: text2
        x: 290
        y: 860
        width: 178
        height: 50
        text: qsTr("hh/mm")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 20
    }

    Text {
        id: day
        x: 51
        y: 661
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: month
        x: 141
        y: 661
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: year
        x: 232
        y: 661
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text12
        x: 114
        y: 661
        width: 15
        height: 50
        text: qsTr("/")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text13
        x: 203
        y: 661
        width: 15
        height: 50
        text: qsTr("/")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: hours
        x: 97
        y: 860
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: minutes
        x: 187
        y: 860
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text16
        x: 160
        y: 860
        width: 15
        height: 50
        text: qsTr(":")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Button {
        id: buttonsetdatetime1
        x: 466
        y: 709
        width: 100
        height: 60
        text: "Set"
        onClicked: {
            utility1.state="Base"
        }
    }


    states: [
        State {
            name: "Confirm"

            PropertyChanges {
                target: btnShoot
                x: 48
                y: 621
            }

            PropertyChanges {
                target: btnWater
                x: 428
                y: 621
            }

            PropertyChanges {
                target: btnGuide
                x: 428
                y: 721
            }

            PropertyChanges {
                target: btnFilter
                x: 428
                y: 821
            }

            PropertyChanges {
                target: btnCut
                x: 48
                y: 721
            }

            PropertyChanges {
                target: yesNo2
                x: 250
                y: 80
            }

            PropertyChanges {
                target: clockButton
                x: 48
                y: 821
            }

            PropertyChanges {
                target: suday
                x: 43
                y: 687
            }

            PropertyChanges {
                target: giuday
                x: 43
                y: 809
            }

            PropertyChanges {
                target: sumonth
                x: 135
                y: 687
            }

            PropertyChanges {
                target: giumonth
                x: 135
                y: 809
            }

            PropertyChanges {
                target: suyear
                x: 224
                y: 687
            }

            PropertyChanges {
                target: giuyear
                x: 224
                y: 809
            }

            PropertyChanges {
                target: suhours
                x: 89
                y: 886
            }

            PropertyChanges {
                target: giuhours
                x: 89
                y: 1008
            }

            PropertyChanges {
                target: suminutes
                x: 178
                y: 886
            }

            PropertyChanges {
                target: giuminutes
                x: 178
                y: 1008
            }

            PropertyChanges {
                target: buttonsetdatetime
                x: 287
                y: 988
            }

            PropertyChanges {
                target: text1
                x: 287
                y: 753
            }

            PropertyChanges {
                target: text2
                x: 287
                y: 952
            }

            PropertyChanges {
                target: day
                x: 48
                y: 753
            }

            PropertyChanges {
                target: month
                x: 138
                y: 753
            }

            PropertyChanges {
                target: year
                x: 229
                y: 753
            }

            PropertyChanges {
                target: text12
                x: 111
                y: 753
            }

            PropertyChanges {
                target: text13
                x: 200
                y: 753
            }

            PropertyChanges {
                target: hours
                x: 94
                y: 952
            }

            PropertyChanges {
                target: minutes
                x: 184
                y: 952
            }

            PropertyChanges {
                target: text16
                x: 157
                y: 952
            }
        },
        State {
            name: "SetTime"

            PropertyChanges {
                target: btnShoot
                x: 468
                y: 689
            }

            PropertyChanges {
                target: btnWater
                x: 848
                y: 689
            }

            PropertyChanges {
                target: btnGuide
                x: 848
                y: 789
            }

            PropertyChanges {
                target: btnFilter
                x: 848
                y: 889
            }

            PropertyChanges {
                target: btnCut
                x: 468
                y: 789
            }

            PropertyChanges {
                target: clockButton
                x: 468
                y: 889
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

            PropertyChanges {
                target: buttonsetdatetime1
                x: 660
                y: 80
                width: 100
                height: 60
                text: "Back"
            }
        }
    ]


}
