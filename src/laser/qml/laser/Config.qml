import QtQuick 1.0

Rectangle {
    id: config
    width: 800
    height: 400

    //radius:10

    color: "#00b3b3b3"

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
        y: 60
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
        y: 165
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
        y: 270
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
                x: 390
                y: 11
                width: 360
                height: 374
            }

            PropertyChanges {
                target: listView1
                height: 374
            }

            PropertyChanges {
                target: button1
                //radius: 8
            }

            PropertyChanges {
                target: btnUsers
                //radius: 4
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
        }
    ]
}

