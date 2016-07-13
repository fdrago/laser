import QtQuick 1.0

Rectangle {

    property int valorenuovo: 0

    onValorenuovoChanged: {
        clickabletext0.value=laserModel.getErrVal(0);
        clickabletext1.value=laserModel.getErrVal(1);
        clickabletext2.value=laserModel.getErrVal(2);
        clickabletext3.value=laserModel.getErrVal(3);
        clickabletext4.value=laserModel.getErrVal(4);
        clickabletext5.value=laserModel.getErrVal(5);
        clickabletext6.value=laserModel.getErrVal(6);
        clickabletext7.value=laserModel.getErrVal(7);
        clickabletext8.value=laserModel.getErrVal(8);

    }

    width: 520
    height: 296
    color: "#00000000"

    Text {
        id: text1
        x: 0
        y: 0
        width: 260
        height: 22
        text: laserModel.getErrString(0)
        font.pixelSize: 18
    }

    Text {
        id: text2
        x: 0
        y: 59
        width: 260
        height: 22
        text: laserModel.getErrString(1)
        font.pixelSize: 18
    }

    Text {
        id: text3
        x: 0
        y: 118
        width: 260
        height: 22
        text: laserModel.getErrString(2)
        font.pixelSize: 18
    }

    Text {
        id: text4
        x: 0
        y: 177
        width: 260
        height: 22
        text: laserModel.getErrString(3)
        font.pixelSize: 18
    }

    Text {
        id: text5
        x: 260
        y: 0
        width: 260
        height: 22
        text: laserModel.getErrString(4)
        font.pixelSize: 18
    }

    Text {
        id: text6
        x: 260
        y: 59
        width: 260
        height: 22
        text: laserModel.getErrString(5)
        font.pixelSize: 18
    }

    Text {
        id: text7
        x: 260
        y: 118
        width: 260
        height: 22
        text: laserModel.getErrString(6)
        font.pixelSize: 18
    }

    Text {
        id: text8
        x: 260
        y: 177
        width: 260
        height: 22
        text: laserModel.getErrString(7)
        font.pixelSize: 18
    }

    Text {
        id: text9
        x: 260
        y: 236
        width: 260
        height: 22
        text: laserModel.getErrString(8)
        font.pixelSize: 18
    }

    Button {
        id: onoff0
        x: 8
        y: 28
        width: 70
        height: 25
        text: (laserModel.getErrVal(0)==-255 && laserModel.getErrNONC(0)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff0.text=="ON")? clickabletext0.disabledvalue=clickabletext0.value : null;
            (onoff0.text=="ON")? clickabletext0.disablednonc=laserModel.getErrNONC(0) : null;
            (onoff0.text=="ON")? laserModel.setErrVal(0, -255) : laserModel.setErrVal(0,clickabletext0.disabledvalue);
            (onoff0.text=="ON")? laserModel.setErrNONC(0,0) : laserModel.setErrNONC(0,clickabletext0.disablednonc);
            (onoff0.text=="ON")? nonc0.visible=false : nonc0.visible=true;
            (onoff0.text=="ON")? clickabletext0.visible=false : clickabletext0.visible=true;
            (onoff0.text=="ON")? onoff0.text="OFF" : onoff0.text="ON";

            clickabletext0.value=laserModel.getErrVal(0);
            nonc0.text=(laserModel.getErrNONC(0)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc0
        x: 84
        y: 28
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(0)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(0)==true) ? laserModel.setErrNONC(0,false) : laserModel.setErrNONC(0,true);
            (laserModel.getErrNONC(0)==false) ? nonc0.text="NC" : nonc0.text="NO";
        }
    }

    Button {
        id: onoff1
        x: 8
        y: 87
        width: 70
        height: 25
        text: (laserModel.getErrVal(1)==-255 && laserModel.getErrNONC(1)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff1.text=="ON")? clickabletext1.disabledvalue=clickabletext1.value : null;
            (onoff1.text=="ON")? clickabletext1.disablednonc=laserModel.getErrNONC(1) : null;
            (onoff1.text=="ON")? laserModel.setErrVal(1, -255) : laserModel.setErrVal(1,clickabletext1.disabledvalue);
            (onoff1.text=="ON")? laserModel.setErrNONC(1,0) : laserModel.setErrNONC(1,clickabletext1.disablednonc);
            (onoff1.text=="ON")? nonc1.visible=false : nonc1.visible=true;
            (onoff1.text=="ON")? clickabletext1.visible=false : clickabletext1.visible=true;
            (onoff1.text=="ON")? onoff1.text="OFF" : onoff1.text="ON";

            clickabletext1.value=laserModel.getErrVal(1);
            nonc1.text=(laserModel.getErrNONC(1)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc1
        x: 84
        y: 87
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(1)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(1)==true) ? laserModel.setErrNONC(1,false) : laserModel.setErrNONC(1,true);
            (laserModel.getErrNONC(1)==false) ? nonc1.text="NC" : nonc1.text="NO";
        }
    }

    Button {
        id: onoff2
        x: 8
        y: 146
        width: 70
        height: 25
        text: (laserModel.getErrVal(2)==-255 && laserModel.getErrNONC(2)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff2.text=="ON")? clickabletext2.disabledvalue=clickabletext2.value : null;
            (onoff2.text=="ON")? clickabletext2.disablednonc=laserModel.getErrNONC(2) : null;
            (onoff2.text=="ON")? laserModel.setErrVal(2, -255) : laserModel.setErrVal(2,clickabletext2.disabledvalue);
            (onoff2.text=="ON")? laserModel.setErrNONC(2,0) : laserModel.setErrNONC(2,clickabletext2.disablednonc);
            (onoff2.text=="ON")? nonc2.visible=false : nonc2.visible=true;
            (onoff2.text=="ON")? clickabletext2.visible=false : clickabletext2.visible=true;
            (onoff2.text=="ON")? onoff2.text="OFF" : onoff2.text="ON";

            clickabletext2.value=laserModel.getErrVal(2);
            nonc2.text=(laserModel.getErrNONC(2)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc2
        x: 84
        y: 146
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(2)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(2)==true) ? laserModel.setErrNONC(2,false) : laserModel.setErrNONC(2,true);
            (laserModel.getErrNONC(2)==false) ? nonc2.text="NC" : nonc2.text="NO";
        }
    }

    Button {
        id: onoff3
        x: 8
        y: 205
        width: 70
        height: 25
        text: (laserModel.getErrVal(3)==-255 && laserModel.getErrNONC(3)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff3.text=="ON")? clickabletext3.disabledvalue=clickabletext3.value : null;
            (onoff3.text=="ON")? clickabletext3.disablednonc=laserModel.getErrNONC(3) : null;
            (onoff3.text=="ON")? laserModel.setErrVal(3, -255) : laserModel.setErrVal(3,clickabletext3.disabledvalue);
            (onoff3.text=="ON")? laserModel.setErrNONC(3,0) : laserModel.setErrNONC(3,clickabletext3.disablednonc);
            (onoff3.text=="ON")? nonc3.visible=false : nonc3.visible=true;
            (onoff3.text=="ON")? clickabletext3.visible=false : clickabletext3.visible=true;
            (onoff3.text=="ON")? onoff3.text="OFF" : onoff3.text="ON";

            clickabletext3.value=laserModel.getErrVal(3);
            nonc3.text=(laserModel.getErrNONC(3)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc3
        x: 84
        y: 205
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(3)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(3)==true) ? laserModel.setErrNONC(3,false) : laserModel.setErrNONC(3,true);
            (laserModel.getErrNONC(3)==false) ? nonc3.text="NC" : nonc3.text="NO";
        }
    }

    Button {
        id: onoff4
        x: 260
        y: 28
        width: 70
        height: 25
        text: (laserModel.getErrVal(4)==-255 && laserModel.getErrNONC(4)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff4.text=="ON")? clickabletext4.disabledvalue=clickabletext4.value : null;
            (onoff4.text=="ON")? clickabletext4.disablednonc=laserModel.getErrNONC(4) : null;
            (onoff4.text=="ON")? laserModel.setErrVal(4, -255) : laserModel.setErrVal(4,clickabletext4.disabledvalue);
            (onoff4.text=="ON")? laserModel.setErrNONC(4,0) : laserModel.setErrNONC(4,clickabletext4.disablednonc);
            (onoff4.text=="ON")? nonc4.visible=false : nonc4.visible=true;
            (onoff4.text=="ON")? clickabletext4.visible=false : clickabletext4.visible=true;
            (onoff4.text=="ON")? onoff4.text="OFF" : onoff4.text="ON";

            clickabletext4.value=laserModel.getErrVal(4);
            nonc4.text=(laserModel.getErrNONC(4)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc4
        x: 336
        y: 28
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(4)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(4)==true) ? laserModel.setErrNONC(4,false) : laserModel.setErrNONC(4,true);
            (laserModel.getErrNONC(4)==false) ? nonc4.text="NC" : nonc4.text="NO";
        }
    }

    Button {
        id: onoff5
        x: 260
        y: 87
        width: 70
        height: 25
        text: (laserModel.getErrVal(5)==-255 && laserModel.getErrNONC(5)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff5.text=="ON")? clickabletext5.disabledvalue=clickabletext5.value : null;
            (onoff5.text=="ON")? clickabletext5.disablednonc=laserModel.getErrNONC(5) : null;
            (onoff5.text=="ON")? laserModel.setErrVal(5, -255) : laserModel.setErrVal(5,clickabletext5.disabledvalue);
            (onoff5.text=="ON")? laserModel.setErrNONC(5,0) : laserModel.setErrNONC(5,clickabletext5.disablednonc);
            (onoff5.text=="ON")? nonc5.visible=false : nonc5.visible=true;
            (onoff5.text=="ON")? clickabletext5.visible=false : clickabletext5.visible=true;
            (onoff5.text=="ON")? onoff5.text="OFF" : onoff5.text="ON";

            clickabletext5.value=laserModel.getErrVal(5);
            nonc5.text=(laserModel.getErrNONC(5)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc5
        x: 336
        y: 87
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(5)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(5)==true) ? laserModel.setErrNONC(5,false) : laserModel.setErrNONC(5,true);
            (laserModel.getErrNONC(5)==false) ? nonc5.text="NC" : nonc5.text="NO";
        }
    }

    Button {
        id: onoff6
        x: 260
        y: 146
        width: 70
        height: 25
        text: (laserModel.getErrVal(6)==-255 && laserModel.getErrNONC(6)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff6.text=="ON")? clickabletext6.disabledvalue=clickabletext6.value : null;
            (onoff6.text=="ON")? clickabletext6.disablednonc=laserModel.getErrNONC(6) : null;
            (onoff6.text=="ON")? laserModel.setErrVal(6, -255) : laserModel.setErrVal(6,clickabletext6.disabledvalue);
            (onoff6.text=="ON")? laserModel.setErrNONC(6,0) : laserModel.setErrNONC(6,clickabletext6.disablednonc);
            (onoff6.text=="ON")? nonc6.visible=false : nonc6.visible=true;
            (onoff6.text=="ON")? clickabletext6.visible=false : clickabletext6.visible=true;
            (onoff6.text=="ON")? onoff6.text="OFF" : onoff6.text="ON";

            clickabletext6.value=laserModel.getErrVal(6);
            nonc6.text=(laserModel.getErrNONC(6)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc6
        x: 336
        y: 146
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(6)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(6)==true) ? laserModel.setErrNONC(6,false) : laserModel.setErrNONC(6,true);
            (laserModel.getErrNONC(6)==false) ? nonc6.text="NC" : nonc6.text="NO";
        }
    }

    Button {
        id: onoff7
        x: 260
        y: 205
        width: 70
        height: 25
        text: (laserModel.getErrVal(7)==-255 && laserModel.getErrNONC(7)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff7.text=="ON")? clickabletext7.disabledvalue=clickabletext7.value : null;
            (onoff7.text=="ON")? clickabletext7.disablednonc=laserModel.getErrNONC(7) : null;
            (onoff7.text=="ON")? laserModel.setErrVal(7, -255) : laserModel.setErrVal(7,clickabletext7.disabledvalue);
            (onoff7.text=="ON")? laserModel.setErrNONC(7,0) : laserModel.setErrNONC(7,clickabletext7.disablednonc);
            (onoff7.text=="ON")? nonc7.visible=false : nonc7.visible=true;
            (onoff7.text=="ON")? clickabletext7.visible=false : clickabletext7.visible=true;
            (onoff7.text=="ON")? onoff7.text="OFF" : onoff7.text="ON";

            clickabletext7.value=laserModel.getErrVal(7);
            nonc7.text=(laserModel.getErrNONC(7)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc7
        x: 336
        y: 205
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(7)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(7)==true) ? laserModel.setErrNONC(7,false) : laserModel.setErrNONC(7,true);
            (laserModel.getErrNONC(7)==false) ? nonc7.text="NC" : nonc7.text="NO";
        }
    }

    Button {
        id: onoff8
        x: 260
        y: 264
        width: 70
        height: 25
        text: (laserModel.getErrVal(8)==-255 && laserModel.getErrNONC(8)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff8.text=="ON")? clickabletext8.disabledvalue=clickabletext8.value : null;
            (onoff8.text=="ON")? clickabletext8.disablednonc=laserModel.getErrNONC(8) : null;
            (onoff8.text=="ON")? laserModel.setErrVal(8, -255) : laserModel.setErrVal(8,clickabletext8.disabledvalue);
            (onoff8.text=="ON")? laserModel.setErrNONC(8,0) : laserModel.setErrNONC(8,clickabletext8.disablednonc);
            (onoff8.text=="ON")? nonc8.visible=false : nonc8.visible=true;
            (onoff8.text=="ON")? clickabletext8.visible=false : clickabletext8.visible=true;
            (onoff8.text=="ON")? onoff8.text="OFF" : onoff8.text="ON";

            clickabletext8.value=laserModel.getErrVal(8);
            nonc8.text=(laserModel.getErrNONC(8)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc8
        x: 336
        y: 264
        width: 70
        height: 25
        textsize: 12
        text: (laserModel.getErrNONC(8)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(8)==true) ? laserModel.setErrNONC(8,false) : laserModel.setErrNONC(8,true);
            (laserModel.getErrNONC(8)==false) ? nonc8.text="NC" : nonc8.text="NO";
        }
    }

    Clickabletext {
        id: clickabletext0
        x: 160
        y: 28
        width: 70
        height: 25
        value: laserModel.getErrVal(0)
        valueid: 0
    }

    Clickabletext {
        id: clickabletext1
        x: 160
        y: 87
        width: 70
        height: 25
        value: laserModel.getErrVal(1)
        valueid: 1
    }

    Clickabletext {
        id: clickabletext2
        x: 160
        y: 146
        width: 70
        height: 25
        value: laserModel.getErrVal(2)
        valueid: 2
    }

    Clickabletext {
        id: clickabletext3
        x: 160
        y: 205
        width: 70
        height: 25
        value: laserModel.getErrVal(3)
        valueid: 3
    }

    Clickabletext {
        id: clickabletext4
        x: 412
        y: 28
        width: 70
        height: 25
        value: laserModel.getErrVal(4)
        valueid: 4
    }

    Clickabletext {
        id: clickabletext5
        x: 412
        y: 87
        width: 70
        height: 25
        value: laserModel.getErrVal(5)
        valueid: 5
    }

    Clickabletext {
        id: clickabletext6
        x: 412
        y: 146
        width: 70
        height: 25
        value: laserModel.getErrVal(6)
        valueid: 6
    }

    Clickabletext {
        id: clickabletext7
        x: 412
        y: 205
        width: 70
        height: 25
        value: laserModel.getErrVal(7)
        valueid: 7
    }

    Clickabletext {
        id: clickabletext8
        x: 412
        y: 264
        width: 70
        height: 25
        value: laserModel.getErrVal(8)
        valueid: 8
    }
}
