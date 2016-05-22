import QtQuick 1.0

Rectangle {
 id: ynmain
    width: 300
    height: 160

    property string cmd: "";

    onXChanged:  {
        if(cmd=="water"){
            ynmain.color= "#2ecc24";
        }
        if(cmd=="guide"){
            ynmain.color= "#2ecc24";
        }
        if(cmd=="filter"){
            ynmain.color= "#2ecc24";
        }
        if(cmd=="deleteuser")
        {
            ynmain.color= "#ff0000";
        }
    }

    Button {
        id: button1
        x: 39
        y: 88
        width: 107
        height: 51
        text: "Yes"
        onClicked: {
            config1.state = "";
            if(cmd=="water"){
                laserModel.setClearWater();
                ynmain.color= "#2ecc24";
            }
            if(cmd=="guide"){
                laserModel.setClearGuide();
                ynmain.color= "#2ecc24";
            }
            if(cmd=="filter"){
                laserModel.setClearFilter();
                ynmain.color= "#2ecc24";
            }
            if(cmd=="deleteuser")
            {
                userList.remove( alphabet1.idx );
                config.state = "Users";
                ynmain.color= "#ff0000";
            }
        }
    }

    Button {
        id: button2
        x: 152
        y: 88
        width: 107
        height: 51
        text: "No"
        onClicked: {
            config1.state = "";

            if(cmd=="deleteuser")
            {

                config.state = "Users"
            }
        }
    }

    Text {
        id: text1
        x: 39
        y: 27
        width: 220
        height: 45
        text: qsTr("Confirm?")
        font.pixelSize: 36
        font.family: myCustomFont.name
    }
}

