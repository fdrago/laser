/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0

Rectangle  {
    id: container

    property string text: ""
    property string backGround: ""
    property string icon:""
    property string iconOff:""
    property int textsize: 24

    property int imgstatus:0

    signal pressed
    signal relased
    signal clicked

    //width: 80
    height: 80

    border  { width: 1; color: "Black" }
    smooth: true
    //radius: 0
    gradient: Gradient {
        GradientStop {
            id: gradientStop1
            position: 0
            color: "#ffffff"
        }

        GradientStop {
            id: gradientStop2
            position: 1
            color: "#aa000000"
        }
    }

    Image {
        id: imgBack
        x: 0
        y: 0
        anchors.fill: parent
        source: backGround
    }

    Image {
        id: imgIcon
        anchors.leftMargin: 0
        x: (buttonLabel.text != "") ? 15 : ((container.width-imgIcon.width)/2)
        y: 0
        //width: (parent.width > 200) ? 80 : 60;
        height: (parent.width > 200) ? 80 : 60;
        anchors.verticalCenter: parent.verticalCenter
        source: (imgstatus) ? iconOff : icon;
        fillMode: Image.PreserveAspectFit
    }

    Text  {
        id: buttonLabel
        color: "white"
        text: container.text
        x: (imgIcon.width==0) ? 0 : (imgIcon.width + 2*imgIcon.x)
        y: 0
        width: (imgIcon.width==0) ? parent.width : (parent.width - 2*imgIcon.x -imgIcon.width)
        height: parent.height
        clip: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: textsize
        font.family: myCustomFont.name
    }
    // color the button with a gradient

    MouseArea  {
        id: mouseArea
        anchors.fill: parent
        //width: 184
        onClicked: {
            container.clicked();
        }

        onPressed: {
            container.pressed();
            //container.state= "Pressed";
        }

        onReleased: {
            container.relased();
            //container.state= "";
        }

    }
    states: [
        State {
            name: "Disable"

            PropertyChanges {
                target: mouseArea
                enabled: false
            }

            PropertyChanges {
                target: buttonLabel
                color: "#6e6e6e"
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: mouseArea
                enabled: false
            }

            PropertyChanges {
                target: buttonLabel
                color: "#6e6e6e"
            }

            PropertyChanges {
                target: gradientStop1
                color: "#aaffffff"
            }

            PropertyChanges {
                target: gradientStop2
                color: "#ff0000"
            }

            PropertyChanges {
                target: container
            }
        }
    ]

}
