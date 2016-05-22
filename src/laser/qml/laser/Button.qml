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

    property string text: "Button"
    property string backGround: ""
    property string icon:""
    property string iconOff:""

    property int imgstatus:0

    signal pressed
    signal relased
    signal clicked

    width: 200
    height: 80

    border  { width: 1; color: "Black" }
    smooth: true
    //radius: 0
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#aaffffff"
        }

        GradientStop {
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
        x: 15
        y: 0
        width: (parent.width > 200) ? 80 : 60;
        height: (parent.width > 200) ? 80 : 60;
        anchors.verticalCenter: parent.verticalCenter
        source: (imgstatus) ? iconOff : icon;
        fillMode: Image.PreserveAspectFit
        anchors.leftMargin: 15
        anchors.topMargin: 10
    }
    Text  {
        id: buttonLabel
        anchors.fill: container
        color: "white"
        text: container.text
        anchors.rightMargin: (icon!="") ? 48 : 0;
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: (icon!="") ? Text.AlignRight : Text.AlignHCenter;
        font.pointSize: 18
        font.family: myCustomFont.name
    }
    // color the button with a gradient

    MouseArea  {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            container.clicked();
        }

        onPressed: {
            container.pressed();
        }

        onReleased: {
            container.relased();
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
        }
    ]

}
