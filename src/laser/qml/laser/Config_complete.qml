import QtQuick 1.0

Rectangle {
    id: config
    width: 700
    height: 400

    radius:10

    color: "#00b2b2b2"

    Component {
        id: logDelegate
        Rectangle {
            id: fileDelegateRectangle
            height: fileDelegateText.height * 1.5
            width: parent.width

            color: "#80b2b2b2"

            Text {
                id: fileDelegateText
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: myCustomFont.name
                text: modelData
            }
        }
    }
    Component {
        id: userDelegate
        Item {
            id: userItem
            width: parent.width
            height: 60
            Rectangle {
                id: rectangle1
                x: 0
                height: parent.height
                width: parent.width
                color: "ivory"
                radius: 5


            }

            Text {
                id: userDelegateText
                font.pixelSize: 40
                text: name
                font.bold: true
                font.family: myCustomFont.name
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        alphabet1.idx = index;
                        alphabet1.name = name;
                        main.state = "Username";
                    }
                }
            }
            Text {
                id: userDelegateTime
                x: 208
                y: 11
                width: 85
                height: 24
                text: time
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 20
                font.family: myCustomFont.name
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        time = "00:00"
                    }
                }
            }
            Text {
                id: userDelegateLevel
                x: 16
                y: 66
                text: level
                visible: false
                font.pixelSize: 20
                font.bold: true
                font.family: myCustomFont.name
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        console.log("delLevel");
                        level = (level==10) ? 1 : 10;
                    }
                }
            }

            Text {
                id: userDelegatePassword
                x: 156
                y: 66
                width: 93
                height: 24
                text: password
                visible: false
                font.pixelSize: 20
                font.family: myCustomFont.name
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        login.idx = index;
                        main.state = "Login";
                    }
                }
            }
            Image {
                id: imageAdd
                x: 308
                y: 8
                width: 50
                height: 50
                source: "../../images/list-add.png"
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        console.log("add");
                        userList.add();
                    }
                }
            }
            Image {
                id: imageDelete
                x: 362
                y: 66
                width: 50
                height: 50
                source: "../../images/list-delete.png"
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        console.log("delete");
                        userList.remove(index);
                    }
                }
            }

            MouseArea {
                id: mouseArea2
                x: 0
                y: 0
                width: 293
                height: 60
                onClicked: {
                    console.log("ma2");
                    userItem.state = "Details"
                }
            }
            states: [
                State {
                    name: "Details"

                    PropertyChanges {
                        target: userItem
                        height: 120
                    }

                    PropertyChanges {
                        target: userDelegatePassword
                        x: 161
                        y: 83
                        visible: true
                    }

                    PropertyChanges {
                        target: userDelegateLevel
                        x: 8
                        y: 83
                        visible: true
                    }
                    PropertyChanges { target: userItem.ListView.view; interactive: false }

                    PropertyChanges {
                        target: imageDelete
                        x: 308
                        y: 70
                    }

                    PropertyChanges {
                        target: mouseArea2
                        x: -299
                        y: 0
                    }

                }
            ]
        }
    }

    Rectangle {
        id: rectangle2
        x: 335
        y: 8
        width: 360
        height: 384
        color: "#80ededed"
        radius: 2
    }

    Button {
        id: btnUsers
        x: 23
        y: 14
        width: 300
        height: 70
        radius: 4
        text: "Users"
        icon: "../../images/users.png"
        state: (config.state=="Users") ? "Disable" : "";
        onClicked: {
            config.state="Users";

        }
    }

    Button {
        id: btnMaintenance
        x: 23
        y: 90
        width: 300
        height: 70
        radius: 4
        text: "Maintenance"
        icon: "../../images/maintenance.png"
        state: (config.state=="Maintenance") ? "Disable" : "";
        onClicked: {
            config.state="Maintenance";

        }
    }

    Button {
        id: btnLogs
        x: 23
        y: 166
        width: 300
        height: 70
        radius: 4
        text: "Logs"
        icon: "../../images/list.png"
        state: (config.state=="Logs") ? "Disable" : "";
        onClicked: {
            config.state="Logs";

        }
    }


    ListView {
        id: listView1
        x: 807
        y: 422
        width: 360
        height: 374
        clip: true
        delegate: userDelegate
        model: usersModel
    }

    Button {
        id: btnWater
        x: 802
        y: 13
        width: 300
        height: 80
        icon: "../../images/acquaCambiata.png"
        text: "Clear water"
        onClicked: {
            yesNo1.cmd = "water";
            config1.state = "Confirm";

        }
    }

    Button {
        id: btnGuide
        x: 802
        y: 112
        width: 300
        height: 80
        text: "Clear guide"
        icon: "../../images/guidePulite.png"
        onClicked: {
            yesNo1.cmd = "guide";
            config1.state = "Confirm";
        }
    }

    Button {
        id: btnFilter
        x: 802
        y: 212
        width: 300
        height: 80
        text: "Clear filter"
        icon: "../../images/filtroPulito.png"
        onClicked: {
            yesNo1.cmd = "filter";
            config1.state = "Confirm";
        }
    }

    Button {
        id: btnNoAlarm
        x: 802
        y: 312
        width: 300
        height: 80
        text: (imgstatus) ? "Alarm Off" : "Alarm On";
        icon: "../../images/sicureOn.png"
        iconOff: "../../images/sicureOff.png"

        onClicked: {
            imgstatus = (imgstatus) ? 0: 1;
            laserModel.setAlarmOff(imgstatus);
        }
    }

    YesNo {
        id: yesNo1
        x: -401
        y: 120
    }


    ListView {
        id: listLogs
        x: 807
        y: 14
        width: 360
        height: 374
        model: modelLogs
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.family: myCustomFont.name
                }
                spacing: 10
            }
        }
    }

    Button {
        id: button1
        x: 23
        y: 242
        width: 300
        height: 70
        radius: 4
        text: "Network"
        icon: "../../images/lan.png"
        onClicked: {
            config.state="Network";

        }

    }

    Text {
        id: text1
        x: 342
        y: 609
        width: 75
        height: 50
        text: qsTr("255")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Buttonsmall {
        id: su1
        x: 350
        y: 543
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: su2
        x: 440
        y: 543
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: su3
        x: 531
        y: 543
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: su4
        x: 621
        y: 543
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: su10_1
        x: 350
        y: 472
        icon: "../../images/su10.png"
    }

    Buttonsmall {
        id: su10_2
        x: 440
        y: 472
        icon: "../../images/su10.png"
    }

    Buttonsmall {
        id: su10_3
        x: 531
        y: 472
        icon: "../../images/su10.png"
    }

    Buttonsmall {
        id: su10_4
        x: 621
        y: 472
        icon: "../../images/su10.png"
    }

    Buttonsmall {
        id: giu1
        x: 350
        y: 665
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: giu2
        x: 440
        y: 665
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: giu3
        x: 531
        y: 665
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: giu4
        x: 621
        y: 665
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: giu10_1
        x: 350
        y: 736
        icon: "../../images/giu10.png"
    }

    Buttonsmall {
        id: giu10_4
        x: 621
        y: 736
        icon: "../../images/giu10.png"
    }

    Buttonsmall {
        id: giu10_3
        x: 531
        y: 736
        icon: "../../images/giu10.png"
    }

    Buttonsmall {
        id: giu10_2
        x: 440
        y: 736
        icon: "../../images/giu10.png"
    }

    Text {
        id: text2
        x: 418
        y: 609
        width: 15
        height: 50
        text: qsTr(".")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
    }

    Text {
        id: text3
        x: 432
        y: 609
        width: 75
        height: 50
        text: qsTr("255")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text4
        x: 507
        y: 609
        width: 15
        height: 50
        text: qsTr(".")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text5
        x: 523
        y: 609
        width: 75
        height: 50
        text: qsTr("255")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text6
        x: 598
        y: 609
        width: 15
        height: 50
        text: qsTr(".")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text7
        x: 613
        y: 609
        width: 75
        height: 50
        text: qsTr("255")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }

    Text {
        id: text8
        x: 350
        y: 414
        width: 331
        height: 50
        text: qsTr("Ip settings")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 30
    }

    Button {
        id: clockButton
        x: 23
        y: 316
        width: 300
        height: 70
        radius: 4
        text: "Clock"
        icon: "../../images/log.png"
        onClicked: {
            config.state="Clock";

        }

    }

    Text {
        id: text9
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
        id: text10
        x: 146
        y: 498
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text11
        x: 237
        y: 498
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text12
        x: 119
        y: 498
        width: 15
        height: 50
        text: qsTr("/")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text13
        x: 208
        y: 498
        width: 15
        height: 50
        text: qsTr("/")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text14
        x: 102
        y: 697
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text15
        x: 192
        y: 697
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text16
        x: 165
        y: 697
        width: 15
        height: 50
        text: qsTr(":")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Buttonsmall {
        id: su5
        x: 51
        y: 432
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu5
        x: 51
        y: 554
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: su6
        x: 143
        y: 432
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu6
        x: 143
        y: 554
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: su7
        x: 232
        y: 432
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu7
        x: 232
        y: 554
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: su8
        x: 97
        y: 631
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu8
        x: 97
        y: 753
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: su9
        x: 186
        y: 631
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu9
        x: 186
        y: 753
        icon: "../../images/giu.png"
    }

    Text {
        id: monthnum
        x: -151
        y: 520
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: hournum
        x: -151
        y: 672
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: daynum
        x: -151
        y: 444
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: minnum
        x: -151
        y: 746
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: yearnum
        x: -151
        y: 596
        width: 50
        height: 50
        text: qsTr("99")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignHCenter
    }

    Buttonsmall {
        id: su10
        x: -225
        y: 439
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu10
        x: -87
        y: 439
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: su15
        x: -225
        y: 515
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu15
        x: -87
        y: 515
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: su16
        x: -225
        y: 591
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu16
        x: -87
        y: 591
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: su17
        x: -225
        y: 667
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu17
        x: -87
        y: 667
        icon: "../../images/giu.png"
    }

    Buttonsmall {
        id: su18
        x: -225
        y: 741
        icon: "../../images/su.png"
    }

    Buttonsmall {
        id: giu18
        x: -87
        y: 741
        icon: "../../images/giu.png"
    }

    Text {
        id: day
        x: -338
        y: 444
        width: 100
        height: 50
        text: qsTr("Day")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 35
    }

    Text {
        id: month
        x: -338
        y: 515
        width: 100
        height: 50
        text: qsTr("Month")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: year
        x: -338
        y: 596
        width: 100
        height: 50
        text: qsTr("Year")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: hour
        x: -338
        y: 672
        width: 100
        height: 50
        text: qsTr("Hour")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: min
        x: -338
        y: 746
        width: 100
        height: 50
        text: qsTr("Min")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: user
        x: 11
        y: -236
        width: 400
        height: 50
        text: qsTr("User: ")
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 35
    }

    Text {
        id: username
        x: 411
        y: -236
        width: 400
        height: 50
        text: qsTr("Utente")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 35
    }

    Button {
        id: level
        x: -115
        y: -246
        text: "Manage Level"
    }

    Button {
        id: button4
        x: 102
        y: -246
        text: "Back"
    }

    Button {
        id: regtag
        x: -115
        y: -346
        text: "Register Tag"
    }

    Button {
        id: dlt
        x: 102
        y: -346
        text: "Delete User"
    }
    states: [
        State {
            name: "Confirm"

            PropertyChanges {
                target: yesNo1
                x: 228
                y: 120
                z: 1
            }
        },
        State {
            name: "Users"

            PropertyChanges {
                target: listView1
                x: 335
                y: 14
                width: 360
                height: 374
            }

            PropertyChanges {
                target: button1
            }
        },
        State {
            name: "Maintenance"

            PropertyChanges {
                target: listView1
                x: 807
                y: 21
            }

            PropertyChanges {
                target: btnWater
                x: 376
                y: 13
            }

            PropertyChanges {
                target: btnGuide
                x: 376
                y: 112
            }

            PropertyChanges {
                target: btnFilter
                x: 376
                y: 212
            }

            PropertyChanges {
                target: btnNoAlarm
                x: 376
                y: 312
            }

        },
        State {
            name: "Logs"

            PropertyChanges {
                target: listView2
                x: 350
                y: 21
                width: 336
                height: 341
            }

            PropertyChanges {
                target: listLogs
                x: 335
                y: 14
                width: 360
                height: 374
            }

            PropertyChanges {
                target: listView1
                height: 374
            }

            PropertyChanges {
                target: button1
                radius: 8
            }

            PropertyChanges {
                target: btnUsers
                radius: 4
            }
        },
        State {
            name: "Network"

            PropertyChanges {
                target: button1
                scale: 1
            }

            PropertyChanges {
                target: rectangle2
                visible: true
            }

            PropertyChanges {
                target: text1
                x: 342
                y: 196
            }

            PropertyChanges {
                target: su1
                x: 350
                y: 130
            }

            PropertyChanges {
                target: su2
                x: 440
                y: 130
            }

            PropertyChanges {
                target: su3
                x: 531
                y: 130
            }

            PropertyChanges {
                target: su4
                x: 621
                y: 130
            }

            PropertyChanges {
                target: su10_1
                x: 350
                y: 59
                icon: "../../images/su10.png"
            }

            PropertyChanges {
                target: su10_2
                x: 440
                y: 59
            }

            PropertyChanges {
                target: su10_3
                x: 531
                y: 59
            }

            PropertyChanges {
                target: su10_4
                x: 621
                y: 59
            }

            PropertyChanges {
                target: giu1
                x: 350
                y: 252
            }

            PropertyChanges {
                target: giu2
                x: 440
                y: 252
            }

            PropertyChanges {
                target: giu3
                x: 531
                y: 252
            }

            PropertyChanges {
                target: giu4
                x: 621
                y: 252
            }

            PropertyChanges {
                target: giu10_1
                x: 350
                y: 323
            }

            PropertyChanges {
                target: giu10_4
                x: 621
                y: 324
            }

            PropertyChanges {
                target: giu10_3
                x: 531
                y: 324
            }

            PropertyChanges {
                target: giu10_2
                x: 440
                y: 324
            }

            PropertyChanges {
                target: text2
                x: 418
                y: 197
            }

            PropertyChanges {
                target: text3
                x: 432
                y: 197
            }

            PropertyChanges {
                target: text4
                x: 507
                y: 197
            }

            PropertyChanges {
                target: text5
                x: 523
                y: 197
            }

            PropertyChanges {
                target: text6
                x: 598
                y: 197
            }

            PropertyChanges {
                target: text7
                x: 613
                y: 197
            }

            PropertyChanges {
                target: text8
                x: 350
                y: 2
            }
        },
        State {
            name: "Clock"
            PropertyChanges {
                target: listView1
                x: 790
                y: 18
                width: 360
                height: 374
            }

            PropertyChanges {
                target: button1
            }

            PropertyChanges {
                target: text9
                x: 397
                y: 80
            }

            PropertyChanges {
                target: text14
                x: 443
                y: 272
            }

            PropertyChanges {
                target: text10
                x: 487
                y: 80
            }

            PropertyChanges {
                target: text12
                x: 460
                y: 80
            }

            PropertyChanges {
                target: text15
                x: 533
                y: 272
            }

            PropertyChanges {
                target: text11
                x: 578
                y: 80
            }

            PropertyChanges {
                target: text13
                x: 549
                y: 80
            }

            PropertyChanges {
                target: text16
                x: 506
                y: 272
            }

            PropertyChanges {
                target: su5
                x: 392
                y: 14
            }

            PropertyChanges {
                target: giu5
                x: 392
                y: 136
            }

            PropertyChanges {
                target: su6
                x: 484
                y: 14
            }

            PropertyChanges {
                target: giu6
                x: 484
                y: 136
            }

            PropertyChanges {
                target: su7
                x: 573
                y: 14
            }

            PropertyChanges {
                target: giu7
                x: 573
                y: 136
            }

            PropertyChanges {
                target: su8
                x: 438
                y: 206
            }

            PropertyChanges {
                target: giu8
                x: 438
                y: 328
            }

            PropertyChanges {
                target: su9
                x: 527
                y: 206
            }

            PropertyChanges {
                target: giu9
                x: 527
                y: 328
            }

            PropertyChanges {
                target: button2
                text: "Clock / Date"
            }

            PropertyChanges {
                target: config
                color: "#00b3b3b3"
            }

            PropertyChanges {
                target: rectangle2
                color: "#80eeeeee"
            }
        },
        State {
            name: "Clock2"

            PropertyChanges {
                target: monthnum
                x: 544
                y: 100
            }

            PropertyChanges {
                target: hournum
                x: 544
                y: 252
            }

            PropertyChanges {
                target: daynum
                x: 544
                y: 24
            }

            PropertyChanges {
                target: minnum
                x: 544
                y: 326
            }

            PropertyChanges {
                target: yearnum
                x: 544
                y: 176
            }

            PropertyChanges {
                target: su10
                x: 470
                y: 19
            }

            PropertyChanges {
                target: giu10
                x: 608
                y: 19
            }

            PropertyChanges {
                target: su15
                x: 470
                y: 95
            }

            PropertyChanges {
                target: giu15
                x: 608
                y: 95
            }

            PropertyChanges {
                target: su16
                x: 470
                y: 171
            }

            PropertyChanges {
                target: giu16
                x: 608
                y: 171
            }

            PropertyChanges {
                target: su17
                x: 470
                y: 247
            }

            PropertyChanges {
                target: giu17
                x: 608
                y: 247
            }

            PropertyChanges {
                target: su18
                x: 470
                y: 321
            }

            PropertyChanges {
                target: giu18
                x: 608
                y: 321
            }

            PropertyChanges {
                target: day
                x: 357
                y: 24
            }

            PropertyChanges {
                target: month
                x: 357
                y: 95
            }

            PropertyChanges {
                target: year
                x: 357
                y: 176
            }

            PropertyChanges {
                target: hour
                x: 357
                y: 252
            }

            PropertyChanges {
                target: min
                x: 357
                y: 326
            }
        },
        State {
            name: "UserSet"

            PropertyChanges {
                target: btnUsers
                x: -125
                y: 472
            }

            PropertyChanges {
                target: btnMaintenance
                x: -125
                y: 548
            }

            PropertyChanges {
                target: btnLogs
                x: -125
                y: 624
            }

            PropertyChanges {
                target: button1
                x: -125
                y: 700
            }

            PropertyChanges {
                target: button2
                x: -125
                y: 774
            }

            PropertyChanges {
                target: rectangle2
                x: 5
                y: 8
                width: 690
                height: 384
                z: -1
            }

            PropertyChanges {
                target: user
                x: 5
                y: 14
                width: 337
                height: 50
            }

            PropertyChanges {
                target: username
                x: 342
                y: 14
                width: 353
                height: 50
            }

            PropertyChanges {
                target: level
                x: 123
                y: 240
            }

            PropertyChanges {
                target: button4
                x: 360
                y: 240
            }

            PropertyChanges {
                target: regtag
                x: 123
                y: 130
            }

            PropertyChanges {
                target: dlt
                x: 360
                y: 130
            }
        }
    ]
}

