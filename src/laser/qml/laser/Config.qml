import QtQuick 1.0

Rectangle {

    property date saveDate


    onSaveDateChanged: {
        day.text=saveDate.getDate()
        month.text=saveDate.getMonth()
        year.text=saveDate.getFullYear()-2000
        hours.text=saveDate.getHours()
        minutes.text=saveDate.getMinutes()
    }

    id: config
    width: 800
    height: 400

    //radius:10

    color: "#00b3b3b3"

    /*Component {
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
    }*/
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
                //radius: 5


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
            /*Text {
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
                text: name
                visible: false
                font.pixelSize: 20
                font.bold: true
                font.family: myCustomFont.name
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        console.log("delLevel");
                        editname = (editname==10) ? 1 : 10;
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
            }*/
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
            /*Image {
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
            }*/

            MouseArea {
                id: mouseArea2
                x: 0
                y: 0
                width: 293
                height: 60
                onClicked: {
                    console.log("ma2");
                    config.state = "UserSet";

                    alphabet1.idx = index;
                    alphabet1.name = name;
                    username.text = name;
                    showpassword.text = password
                    showname.text = name
                    showlevel.text = level
                    editlevel.levelVal = level
                    //userItem.state = "Details"
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
        x: 400
        y: 10
        width: 390
        height: 380
        color: "#80eeeeee"
        //radius: 2
    }

    Button {
        id: btnUsers
        x: 50
        y: 10
        width: 300
        height: 80
        //radius: 4
        text: "Users"
        icon: "../../images/users.png"
        state: (config.state=="Users") ? "Disable" : "";
        onClicked: {
            config.state="Users";

        }
    }

    Button {
        id: btnMaintenance
        x: 50
        y: 110
        width: 300
        height: 80
        //radius: 4
        text: "Maintenance"
        icon: "../../images/maintenance.png"
        state: (config.state=="Maintenance") ? "Disable" : "";
        onClicked: {
            config.state="Maintenance";

        }
    }

    Button {
        id: btnLogs
        x: 50
        y: 210
        width: 300
        height: 80
        //radius: 4
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
            height: 15
            Row {
                id: row1
                Rectangle {
                    width: 350
                    height: 15
                    color: "#00000000";

                    Text {
                        color: "#000000"
                        text: modelData
                        anchors.fill: parent
                        font.bold: false
                        font.pixelSize: 12

                    }
                }
                spacing: 10
            }
        }
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
        x: 417
        y: -236
        width: 400
        height: 50
        text: qsTr("Name")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 35
    }

    Button {
        id: editname
        x: -115
        y: -246
        text: "Edit"
        onClicked: {
            main.state = "Username";
            config.state = "Users"
        }
    }

    Button {
        id: editpassword
        x: 102
        y: -246
        text: "Edit"
        onClicked: {
            login.idx = alphabet1.idx;
            main.state = "Login";
            config.state = "Users"
        }
    }

    Button {
        id: deleteuser
        x: 102
        y: -346
        text: "Delete User"
        onClicked: {
            console.log("delete");
            yesNo1.cmd = "deleteuser";
            config1.state = "Confirm";
            //userList.remove( alphabet1.idx );
            //config.state = "Users"
        }
    }

    Button {
        property int levelVal: -1;

        id: editlevel
        x: -115
        y: -346
        text: "Edit"
        onClicked: {
            var l = (levelVal==10) ? 1 : 10;
            laserModel.setLevel(  alphabet1.idx, l );
            showlevel.text = l
            levelVal = l
        }
    }

    Button {
        id: backtolist
        x: -9
        y: -160
        text: "Back"
        onClicked: {
            config.state = "Users"
        }
    }

    Text {
        id: showpassword
        x: 402
        y: -402
        width: 400
        height: 50
        text: qsTr("Password")
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
    }

    Text {
        id: showname
        x: 402
        y: -458
        width: 400
        height: 50
        text: qsTr("Name")
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
    }

    Text {
        id: showlevel
        x: 402
        y: -346
        width: 400
        height: 50
        text: qsTr("Level")
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 35
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
        x: 50
        y: 310
        width: 300
        height: 80
        text: "Clock"
        icon: "../../images/log.png"
        state: (config.state=="SetTime") ? "Disable" : "";
        onClicked: {
            config.state="SetTime"
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
            laserModel.setDate(saveDate);
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
    states: [
        State {
            name: "Confirm"

            PropertyChanges {
                target: yesNo1
                x: 228
                y: 120
                //color: "#2ecc24"
                z: 1
            }

            PropertyChanges {
                target: btnUsers
                x: -443
                y: 0
                visible: true
            }

            PropertyChanges {
                target: btnMaintenance
                x: -482
                y: 182
            }

            PropertyChanges {
                target: btnLogs
                x: -453
                y: 369
            }

            PropertyChanges {
                target: rectangle2
                x: 833
                y: 99
                color: "#80eeeeee"
            }
        },
        State {
            name: "Users"

            PropertyChanges {
                target: listView1
                x: 400
                y: 10
                width: 390
                height: 380
            }

            PropertyChanges {
                target: buttonsetdatetime
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
                x: 410
                y: 25
                width: 370
            }

            PropertyChanges {
                target: btnGuide
                x: 410
                y: 115
                width: 370
            }

            PropertyChanges {
                target: btnFilter
                x: 410
                y: 205
                width: 370
                height: 79
            }

            PropertyChanges {
                target: btnNoAlarm
                x: 410
                y: 295
                width: 370
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
                x: 410
                y: 20
                width: 370
                height: 360
                clip: true
            }

            PropertyChanges {
                target: listView1
                height: 374
            }

            PropertyChanges {
                target: buttonsetdatetime
                //radius: 8
            }

            PropertyChanges {
                target: btnUsers
                //radius: 4
            }

            PropertyChanges {
                target: rectangle2
                x: 400
                y: 10
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
                target: buttonsetdatetime
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
                x: 1
                y: 1
                width: 800
                height: 400
                z: -1
            }

            PropertyChanges {
                target: user
                x: 50
                y: 17
                width: 350
                height: 50
            }

            PropertyChanges {
                target: username
                x: 400
                y: 17
                width: 350
                height: 50
                verticalAlignment: "AlignTop"
            }

            PropertyChanges {
                target: editname
                x: 627
                y: 82
                width: 123
                height: 80
                anchors.rightMargin: 50
                //text: "Edit"
            }

            PropertyChanges {
                target: editpassword
                x: 627
                y: 192
                width: 123
                height: 80
                //text: "Edit"
            }

            PropertyChanges {
                target: regtag
                x: 123
                y: 130
            }

            PropertyChanges {
                target: deleteuser
                x: 50
                y: 192
                width: 350
                height: 80
                imgstatus: 0
                //text: "Delete"
            }

            PropertyChanges {
                target: editlevel
                x: 280
                y: 82
                width: 120
                height: 80
                //text: "Edit"
            }

            PropertyChanges {
                target: backtolist
                x: 300
                y: 302
            }

            PropertyChanges {
                target: showpassword
                x: 421
                y: 207
                width: 200
                height: 50
                //text: qsTr("Password")
            }

            PropertyChanges {
                target: showlevel
                x: 74
                y: 97
                width: 200
                height: 50
                //text: qsTr("Level")
            }

            PropertyChanges {
                target: showname
                x: 421
                y: 97
                width: 200
                height: 50
                //text: qsTr("Name")
            }

            PropertyChanges {
                target: showuser
                x: 348
                y: 95
                width: 182
                height: 50
                //text: qsTr("Name")
            }
        },
        State {
            name: "SetTime"
            PropertyChanges {
                target: listView1
                x: 400
                y: 433
                width: 390
                height: 380
            }

            PropertyChanges {
                target: buttonsetdatetime
                x: 656
                y: 320
                width: 122
                height: 60
                text: "Set"
                opacity: 1
            }

            PropertyChanges {
                target: day
                x: 417
                y: 80
            }

            PropertyChanges {
                target: month
                x: 507
                y: 80
            }

            PropertyChanges {
                target: year
                x: 598
                y: 80
            }

            PropertyChanges {
                target: text12
                x: 480
                y: 80
            }

            PropertyChanges {
                target: text13
                x: 569
                y: 80
            }

            PropertyChanges {
                target: hours
                x: 417
                y: 270
            }

            PropertyChanges {
                target: minutes
                x: 507
                y: 270
            }

            PropertyChanges {
                target: text16
                x: 480
                y: 270
            }

            PropertyChanges {
                target: suday
                x: 412
                y: 20
            }

            PropertyChanges {
                target: giuday
                x: 412
                y: 130
            }

            PropertyChanges {
                target: sumonth
                x: 504
                y: 20
            }

            PropertyChanges {
                target: giumonth
                x: 504
                y: 130
            }

            PropertyChanges {
                target: suyear
                x: 593
                y: 20
            }

            PropertyChanges {
                target: giuyear
                x: 593
                y: 130
            }

            PropertyChanges {
                target: suhours
                x: 412
                y: 210
            }

            PropertyChanges {
                target: giuhours
                x: 412
                y: 320
            }

            PropertyChanges {
                target: suminutes
                x: 501
                y: 210
            }

            PropertyChanges {
                target: giuminutes
                x: 501
                y: 320
            }

            PropertyChanges {
                target: rectangle2
                x: 400
                y: 10
            }

            PropertyChanges {
                target: text1
                x: 658
                y: 80
                width: 119
                height: 50
            }

            PropertyChanges {
                target: text2
                x: 567
                y: 270
            }
        }
    ]
}

