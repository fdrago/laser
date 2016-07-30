import QtQuick 1.0

Rectangle {

    property double disabledpress: -1

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
        clickabletext9.value=laserModel.getErrVal(9);
        clickabletext10.value=laserModel.getErrVal(10);
        paramValue0.value=laserModel.getParamVal(0);
        paramValue1.value=laserModel.getParamVal(1);
        paramValue2.value=laserModel.getParamVal(2);
        paramValue3.value=laserModel.getParamVal(3);
        paramValue4.value=laserModel.getParamVal(4);
        paramValue5.value=laserModel.getParamVal(5);
        paramValue7.value=laserModel.getParamVal(7);
        presValue.text = laserModel.getParamVal(6)
    }

    id: machinesetup
    width: 520
    height: 296
    color: "#00000000"

    Text {
        id: text0
        x: 0
        y: 0
        width: 260
        height: 22
        text: laserModel.getErrString(0)
        font.pixelSize: 18
    }

    Text {
        id: text1
        x: 0
        y: 64
        width: 260
        height: 22
        text: laserModel.getErrString(1)
        font.pixelSize: 18
    }

    Text {
        id: text2
        x: 0
        y: 128
        width: 260
        height: 22
        text: laserModel.getErrString(2)
        font.pixelSize: 18
    }

    Text {
        id: text3
        x: -967
        y: -334
        width: 260
        height: 22
        text: laserModel.getErrString(3)
        font.pixelSize: 18
    }

    Text {
        id: text4
        x: 260
        y: 0
        width: 260
        height: 22
        text: laserModel.getErrString(4)
        font.pixelSize: 18
    }

    Text {
        id: text5
        x: 260
        y: 64
        width: 260
        height: 22
        text: laserModel.getErrString(5)
        font.pixelSize: 18
    }

    Text {
        id: text6
        x: 260
        y: 128
        width: 260
        height: 22
        text: laserModel.getErrString(6)
        font.pixelSize: 18
    }

    Text {
        id: text7
        x: -707
        y: -334
        width: 260
        height: 22
        text: laserModel.getErrString(7)
        font.pixelSize: 18
    }

    Text {
        id: text8
        x: -967
        y: -270
        width: 260
        height: 22
        text: laserModel.getErrString(8)
        font.pixelSize: 18
    }

    Text {
        id: text9
        x: -707
        y: -270
        width: 260
        height: 22
        text: laserModel.getErrString(9)
        font.pixelSize: 18
    }

    Text {
     id: text10
     x: -967
     y: -206
     width: 260
     height: 22
     text: laserModel.getErrString(10)
     font.pixelSize: 18
 }

    Button {
        id: onoff0
        x: 8
        y: 28
        width: 70
        height: 30
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
        height: 30
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
        y: 92
        width: 70
        height: 30
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
        y: 92
        width: 70
        height: 30
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
        y: 156
        width: 70
        height: 30
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
        y: 156
        width: 70
        height: 30
        textsize: 12
        text: (laserModel.getErrNONC(2)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(2)==true) ? laserModel.setErrNONC(2,false) : laserModel.setErrNONC(2,true);
            (laserModel.getErrNONC(2)==false) ? nonc2.text="NC" : nonc2.text="NO";
        }
    }

    Button {
        id: onoff3
        x: -959
        y: -306
        width: 70
        height: 30
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
        x: -883
        y: -306
        width: 70
        height: 30
        textsize: 12
        text: (laserModel.getErrNONC(3)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(3)==true) ? laserModel.setErrNONC(3,false) : laserModel.setErrNONC(3,true);
            (laserModel.getErrNONC(3)==false) ? nonc3.text="NC" : nonc3.text="NO";
        }
    }

    Button {
        id: onoff4
        x: 268
        y: 28
        width: 70
        height: 30
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
        x: 344
        y: 28
        width: 70
        height: 30
        textsize: 12
        text: (laserModel.getErrNONC(4)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(4)==true) ? laserModel.setErrNONC(4,false) : laserModel.setErrNONC(4,true);
            (laserModel.getErrNONC(4)==false) ? nonc4.text="NC" : nonc4.text="NO";
        }
    }

    Button {
        id: onoff5
        x: 268
        y: 92
        width: 70
        height: 30
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
        x: 344
        y: 92
        width: 70
        height: 30
        textsize: 12
        text: (laserModel.getErrNONC(5)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(5)==true) ? laserModel.setErrNONC(5,false) : laserModel.setErrNONC(5,true);
            (laserModel.getErrNONC(5)==false) ? nonc5.text="NC" : nonc5.text="NO";
        }
    }

    Button {
        id: onoff6
        x: 268
        y: 156
        width: 70
        height: 30
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
        x: 344
        y: 156
        width: 70
        height: 30
        textsize: 12
        text: (laserModel.getErrNONC(6)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(6)==true) ? laserModel.setErrNONC(6,false) : laserModel.setErrNONC(6,true);
            (laserModel.getErrNONC(6)==false) ? nonc6.text="NC" : nonc6.text="NO";
        }
    }

    Button {
        id: onoff7
        x: -699
        y: -306
        width: 70
        height: 30
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
        x: -623
        y: -306
        width: 70
        height: 30
        textsize: 12
        text: (laserModel.getErrNONC(7)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(7)==true) ? laserModel.setErrNONC(7,false) : laserModel.setErrNONC(7,true);
            (laserModel.getErrNONC(7)==false) ? nonc7.text="NC" : nonc7.text="NO";
        }
    }

    Button {
        id: onoff8
        x: -959
        y: -242
        width: 70
        height: 30
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
        x: -883
        y: -242
        width: 70
        height: 30
        textsize: 12
        text: (laserModel.getErrNONC(8)==true)? "NO" : "NC"
        onClicked: {
            (laserModel.getErrNONC(8)==true) ? laserModel.setErrNONC(8,false) : laserModel.setErrNONC(8,true);
            (laserModel.getErrNONC(8)==false) ? nonc8.text="NC" : nonc8.text="NO";
        }
    }

    Button {
        id: onoff9
        x: -699
        y: -242
        width: 70
        height: 30
        text: (laserModel.getErrVal(9)==-255 && laserModel.getErrNONC(9)==0)? "OFF" : "ON"
        textsize: 12
        onClicked: {

            (onoff9.text=="ON")? clickabletext9.disabledvalue=clickabletext9.value : null;
            (onoff9.text=="ON")? clickabletext9.disablednonc=laserModel.getErrNONC(9) : null;
            (onoff9.text=="ON")? laserModel.setErrVal(9, -255) : laserModel.setErrVal(9,clickabletext9.disabledvalue);
            (onoff9.text=="ON")? laserModel.setErrNONC(9,0) : laserModel.setErrNONC(9,clickabletext9.disablednonc);
            (onoff9.text=="ON")? nonc9.visible=false : nonc9.visible=true;
            (onoff9.text=="ON")? clickabletext9.visible=false : clickabletext9.visible=true;
            (onoff9.text=="ON")? onoff9.text="OFF" : onoff9.text="ON";

            clickabletext9.value=laserModel.getErrVal(9);
            nonc9.text=(laserModel.getErrNONC(9)==true)? "NO" : "NC";
        }

    }

    Button {
        id: nonc9
        x: -623
        y: -242
        width: 70
        height: 30
        text: (laserModel.getErrNONC(9)==true)? "NO" : "NC"
        textsize: 12
        onClicked: {
            (laserModel.getErrNONC(9)==true) ? laserModel.setErrNONC(9,false) : laserModel.setErrNONC(9,true);
        (laserModel.getErrNONC(9)==false) ? nonc9.text="NC" : nonc9.text="NO";
        }
    }

    Button {
        id: onoff10
        x: -959
        y: -178
        width: 70
        height: 30
        text: (laserModel.getErrVal(10)==-255 && laserModel.getErrNONC(10)==0)? "OFF" : "ON"
        textsize: 12

        onClicked: {

            (onoff10.text=="ON")? clickabletext10.disabledvalue=clickabletext10.value : null;
            (onoff10.text=="ON")? clickabletext10.disablednonc=laserModel.getErrNONC(10) : null;
            (onoff10.text=="ON")? laserModel.setErrVal(10, -255) : laserModel.setErrVal(10,clickabletext10.disabledvalue);
            (onoff10.text=="ON")? laserModel.setErrNONC(10,0) : laserModel.setErrNONC(10,clickabletext10.disablednonc);
            (onoff10.text=="ON")? nonc10.visible=false : nonc10.visible=true;
            (onoff10.text=="ON")? clickabletext10.visible=false : clickabletext10.visible=true;
            (onoff10.text=="ON")? onoff10.text="OFF" : onoff10.text="ON";

            clickabletext10.value=laserModel.getErrVal(10);
            nonc10.text=(laserModel.getErrNONC(10)==true)? "NO" : "NC";
        }
    }

    Button {
        id: nonc10
        x: -883
        y: -178
        width: 70
        height: 30
        text: (laserModel.getErrNONC(10)==true)? "NO" : "NC"
        textsize: 12
        onClicked: {
            (laserModel.getErrNONC(10)==true) ? laserModel.setErrNONC(10,false) : laserModel.setErrNONC(10,true);
            (laserModel.getErrNONC(10)==false) ? nonc10.text="NC" : nonc10.text="NO";
        }
    }

    Clickabletext {
        id: clickabletext0
        x: 160
        y: 28
        width: 70
        height: 30
        value: laserModel.getErrVal(0)
        valueid: 0
    }

    Clickabletext {
        id: clickabletext1
        x: 160
        y: 92
        width: 70
        height: 30
        value: laserModel.getErrVal(1)
        valueid: 1
    }

    Clickabletext {
        id: clickabletext2
        x: 160
        y: 156
        width: 70
        height: 30
        value: laserModel.getErrVal(2)
        valueid: 2
    }

    Clickabletext {
        id: clickabletext3
        x: -807
        y: -306
        width: 70
        height: 30
        value: laserModel.getErrVal(3)
        valueid: 3
    }

    Clickabletext {
        id: clickabletext4
        x: 420
        y: 28
        width: 70
        height: 30
        value: laserModel.getErrVal(4)
        valueid: 4
    }

    Clickabletext {
        id: clickabletext5
        x: 420
        y: 92
        width: 70
        height: 30
        value: laserModel.getErrVal(5)
        valueid: 5
    }

    Clickabletext {
        id: clickabletext6
        x: 420
        y: 156
        width: 70
        height: 30
        value: laserModel.getErrVal(6)
        valueid: 6
    }

    Clickabletext {
        id: clickabletext7
        x: -547
        y: -306
        width: 70
        height: 30
        value: laserModel.getErrVal(7)
        valueid: 7
    }

    Clickabletext {
        id: clickabletext8
        x: -807
        y: -242
        width: 70
        height: 30
        value: laserModel.getErrVal(8)
        valueid: 8
    }

    Clickabletext {
            id: clickabletext9
            x: -547
            y: -242
            width: 70
            height: 30
            valueid: 9
            value: laserModel.getErrVal(9)
        }

    Clickabletext {
        id: clickabletext10
        x: -807
        y: -178
        width: 70
        height: 30
        valueid: 10
        value: laserModel.getErrVal(10)
    }

    Button {
        id: pagepiu
        x: 432
        y: 244
        width: 80
        height: 45
        text: ">"
        onClicked: {
            (machinesetup.state=="")? machinesetup.state="Page2" : machinesetup.state="Page3";
        }
    }

    Button {
        id: pagemeno
        x: 260
        y: 244
        width: 80
        height: 45
        text: "<"
        onClicked: {
            (machinesetup.state=="Page3")? machinesetup.state="Page2" : machinesetup.state="";
        }

    }

    Text {
        id: pagenumber
        x: 340
        y: 244
        width: 91
        height: 45
        text: qsTr("1/3")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 24
    }

    Text {
        id: paramText0
        x: -67
        y: -383
        width: 260
        height: 22
        text: laserModel.getParamName(0)
        font.pixelSize: 18
    }

    Clickabletext {
        id: paramValue0
        x: -58
        y: -355
        width: 70
        height: 30
        valueid: 1000
        value: laserModel.getParamVal(0)
    }

    Text {
        id: paramText1
        x: -67
        y: -324
        width: 260
        height: 22
        text: laserModel.getParamName(1)
        font.pixelSize: 18
    }

    Clickabletext {
        id: paramValue1
        x: -58
        y: -296
        width: 70
        height: 30
        valueid: -1
        value: laserModel.getParamVal(1)
    }

    Text {
        id: paramText2
        x: -67
        y: -265
        width: 260
        height: 22
        text: laserModel.getParamName(2)
        font.pixelSize: 18
    }

    Clickabletext {
        id: paramValue2
        x: -58
        y: -237
        width: 70
        height: 30
        valueid: 1002
        value: laserModel.getParamVal(2)
    }

    Text {
        id: paramText3
        x: -67
        y: -206
        width: 260
        height: 22
        text: laserModel.getParamName(3)
        font.pixelSize: 18
    }

    Clickabletext {
        id: paramValue3
        x: -58
        y: -178
        width: 70
        height: 30
        valueid: -1
        value: laserModel.getParamVal(3)
    }

    Text {
        id: paramText4
        x: 193
        y: -383
        width: 260
        height: 22
        text: laserModel.getParamName(4)
        font.pixelSize: 18
    }

    Clickabletext {
        id: paramValue4
        x: 202
        y: -355
        width: 70
        height: 30
        valueid: 1004
        value: laserModel.getParamVal(4)
    }

    Text {
        id: paramText5
        x: 193
        y: -324
        width: 260
        height: 22
        text: laserModel.getParamName(5)
        font.pixelSize: 18
    }

    Clickabletext {
        id: paramValue5
        x: 202
        y: -296
        width: 70
        height: 30
        valueid: -1
        value: laserModel.getParamVal(5)
    }

    Text {
        id: paramText6
        x: 193
        y: -265
        width: 260
        height: 22
        text: laserModel.getParamName(6)
        font.pixelSize: 18
    }

    Text {
        id: paramText7
        x: 193
        y: -206
        width: 260
        height: 22
        text: laserModel.getParamName(7)
        font.pixelSize: 18
    }

    Clickabletext {
        id: paramValue7
        x: 202
        y: -178
        width: 70
        height: 30
        valueid: -1
        value: laserModel.getParamVal(7)
    }

    Button {
        id: onoffPres
        x: -959
        y: -128
        width: 70
        height: 30
        text: (laserModel.getParamVal(6)=="-1")? "OFF" : "ON"
        textsize: 12
        onClicked: {
            (onoffPres.text=="OFF")? laserModel.setParamVal(6,setPointPset) : laserModel.setParamVal(6,-1)
            onoffPres.text = (laserModel.getParamVal(6)=="-1")? "OFF" : "ON"
            presValue.text = laserModel.getParamVal(6)
        }

        Rectangle {
            id: presRect
            x: 152
            y: 0
            width: 70
            height: 30
            color: "#ffffff"
            visible: (onoffPres.text=="ON")? true : false
        }

        Text {
            id: presValue
            x: 152
            y: 0
            width: 70
            height: 30
            text: "NA"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            visible: (onoffPres.text=="ON")? true : false
        }
    }



    states: [
        State {
            name: "Page2"

            PropertyChanges {
                target: text0
                x: -864
                y: -278
            }

            PropertyChanges {
                target: text1
                x: -864
                y: -215
            }

            PropertyChanges {
                target: text2
                x: -864
                y: -151
            }

            PropertyChanges {
                target: text4
                x: -604
                y: -278
            }

            PropertyChanges {
                target: text5
                x: -604
                y: -215
            }

            PropertyChanges {
                target: text6
                x: -604
                y: -151
            }

            PropertyChanges {
                target: onoff0
                x: -856
                y: -250
            }

            PropertyChanges {
                target: nonc0
                x: -780
                y: -250
            }

            PropertyChanges {
                target: onoff1
                x: -856
                y: -187
            }

            PropertyChanges {
                target: nonc1
                x: -780
                y: -187
            }

            PropertyChanges {
                target: onoff2
                x: -856
                y: -123
            }

            PropertyChanges {
                target: nonc2
                x: -780
                y: -123
            }

            PropertyChanges {
                target: onoff4
                x: -604
                y: -250
            }

            PropertyChanges {
                target: nonc4
                x: -528
                y: -250
            }

            PropertyChanges {
                target: onoff5
                x: -604
                y: -187
            }

            PropertyChanges {
                target: nonc5
                x: -528
                y: -187
            }

            PropertyChanges {
                target: onoff6
                x: -604
                y: -123
            }

            PropertyChanges {
                target: nonc6
                x: -528
                y: -123
            }

            PropertyChanges {
                target: clickabletext0
                x: -704
                y: -250
            }

            PropertyChanges {
                target: clickabletext1
                x: -704
                y: -187
            }

            PropertyChanges {
                target: clickabletext2
                x: -704
                y: -123
            }

            PropertyChanges {
                target: clickabletext4
                x: -452
                y: -250
            }

            PropertyChanges {
                target: clickabletext5
                x: -452
                y: -187
            }

            PropertyChanges {
                target: clickabletext6
                x: -452
                y: -123
            }

            PropertyChanges {
                target: text3
                x: 0
                y: 0
            }

            PropertyChanges {
                target: text7
                x: 260
                y: 0
            }

            PropertyChanges {
                target: text8
                x: 0
                y: 64
            }

            PropertyChanges {
                target: text9
                x: 260
                y: 64
            }

            PropertyChanges {
                target: text10
                x: 0
                y: 128
            }

            PropertyChanges {
                target: onoff3
                x: 8
                y: 28
            }

            PropertyChanges {
                target: nonc3
                x: 84
                y: 28
            }

            PropertyChanges {
                target: onoff7
                x: 268
                y: 28
            }

            PropertyChanges {
                target: nonc7
                x: 344
                y: 28
            }

            PropertyChanges {
                target: onoff8
                x: 8
                y: 92
            }

            PropertyChanges {
                target: nonc8
                x: 84
                y: 92
            }

            PropertyChanges {
                target: onoff9
                x: 268
                y: 92
            }

            PropertyChanges {
                target: nonc9
                x: 344
                y: 92
            }

            PropertyChanges {
                target: onoff10
                x: 8
                y: 156
            }

            PropertyChanges {
                target: nonc10
                x: 84
                y: 156
            }

            PropertyChanges {
                target: clickabletext3
                x: 160
                y: 28
            }

            PropertyChanges {
                target: clickabletext7
                x: 420
                y: 28
            }

            PropertyChanges {
                target: clickabletext8
                x: 160
                y: 92
            }

            PropertyChanges {
                target: clickabletext9
                x: 420
                y: 92
            }

            PropertyChanges {
                target: clickabletext10
                x: 160
                y: 156
            }

            PropertyChanges {
                target: pagenumber
                text: qsTr("2/3")
            }

            PropertyChanges {
                target: paramText6
                x: 260
                y: 128
            }

            PropertyChanges {
                target: paramValue6
                x: 269
                y: 156
            }

            PropertyChanges {
                target: onoff11
                x: 268
                y: 156
            }

            PropertyChanges {
                target: onoffPres
                x: 268
                y: 156
            }
        },
        State {
            name: "Page3"

            PropertyChanges {
                target: text0
                x: -864
                y: -278
            }

            PropertyChanges {
                target: text1
                x: -864
                y: -215
            }

            PropertyChanges {
                target: text2
                x: -864
                y: -151
            }

            PropertyChanges {
                target: text4
                x: -604
                y: -278
            }

            PropertyChanges {
                target: text5
                x: -604
                y: -215
            }

            PropertyChanges {
                target: text6
                x: -604
                y: -151
            }

            PropertyChanges {
                target: onoff0
                x: -856
                y: -250
            }

            PropertyChanges {
                target: nonc0
                x: -780
                y: -250
            }

            PropertyChanges {
                target: onoff1
                x: -856
                y: -187
            }

            PropertyChanges {
                target: nonc1
                x: -780
                y: -187
            }

            PropertyChanges {
                target: onoff2
                x: -856
                y: -123
            }

            PropertyChanges {
                target: nonc2
                x: -780
                y: -123
            }

            PropertyChanges {
                target: onoff4
                x: -596
                y: -250
            }

            PropertyChanges {
                target: nonc4
                x: -520
                y: -250
            }

            PropertyChanges {
                target: onoff5
                x: -596
                y: -187
            }

            PropertyChanges {
                target: nonc5
                x: -520
                y: -187
            }

            PropertyChanges {
                target: onoff6
                x: -596
                y: -123
            }

            PropertyChanges {
                target: nonc6
                x: -520
                y: -123
            }

            PropertyChanges {
                target: clickabletext0
                x: -704
                y: -250
            }

            PropertyChanges {
                target: clickabletext1
                x: -704
                y: -187
            }

            PropertyChanges {
                target: clickabletext2
                x: -704
                y: -123
            }

            PropertyChanges {
                target: clickabletext4
                x: -444
                y: -248
            }

            PropertyChanges {
                target: clickabletext5
                x: -444
                y: -187
            }

            PropertyChanges {
                target: clickabletext6
                x: -444
                y: -123
            }

            PropertyChanges {
                target: text11
                x: 1
                y: 0
            }

            PropertyChanges {
                target: clickabletext11
                x: 10
                y: 28
            }

            PropertyChanges {
                target: clickabletext12
                x: 10
                y: 87
            }

            PropertyChanges {
                target: clickabletext13
                x: 10
                y: 146
            }

            PropertyChanges {
                target: text14
                x: 1
                y: 177
            }

            PropertyChanges {
                target: clickabletext14
                x: 10
                y: 205
            }

            PropertyChanges {
                target: text15
                x: 261
                y: 0
            }

            PropertyChanges {
                target: clickabletext15
                x: 270
                y: 28
            }

            PropertyChanges {
                target: clickabletext16
                x: 270
                y: 87
            }

            PropertyChanges {
                target: text17
                x: 261
                y: 118
            }

            PropertyChanges {
                target: clickabletext17
                x: 270
                y: 146
            }

            PropertyChanges {
                target: text18
                x: 261
                y: 177
            }

            PropertyChanges {
                target: clickabletext18
                x: 270
                y: 205
            }

            PropertyChanges {
                target: pagemeno
                height: 45
            }

            PropertyChanges {
                target: pagenumber
                text: qsTr("3/3")
            }

            PropertyChanges {
                target: paramText0
                x: 1
                y: 0
            }

            PropertyChanges {
                target: paramValue0
                x: 10
                y: 28
            }

            PropertyChanges {
                target: paramText1
                x: 1
                y: 59
            }

            PropertyChanges {
                target: paramValue1
                x: 10
                y: 87
            }

            PropertyChanges {
                target: paramText2
                x: 1
                y: 118
            }

            PropertyChanges {
                target: paramValue2
                x: 10
                y: 146
            }

            PropertyChanges {
                target: paramText3
                x: 1
                y: 177
            }

            PropertyChanges {
                target: paramValue3
                x: 10
                y: 205
            }

            PropertyChanges {
                target: paramText4
                x: 261
                y: 0
            }

            PropertyChanges {
                target: paramValue4
                x: 270
                y: 28
            }

            PropertyChanges {
                target: paramText5
                x: 261
                y: 59
            }

            PropertyChanges {
                target: paramValue5
                x: 270
                y: 87
            }

            PropertyChanges {
                target: paramText6
                x: 62
                y: -357
            }

            PropertyChanges {
                target: paramValue6
                x: 71
                y: -329
            }

            PropertyChanges {
                target: paramText7
                x: 261
                y: 118
            }

            PropertyChanges {
                target: paramValue7
                x: 270
                y: 146
            }

        }
    ]

}
