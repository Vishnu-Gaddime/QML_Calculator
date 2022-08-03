import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: mainWindow
    width: 250
    height: 355
    opacity: 0.9
    flags: Qt.Window | Qt.FramelessWindowHint |Qt.WindowStaysOnTopHint
    visible: true
    minimumWidth: 250
    minimumHeight: 355
    maximumWidth: 250
    maximumHeight: 355
    title: ""
    property int previousX
    property int previousY
    property string anser: "0"
    property string formula: ""
    property color c1: "#ffffff"
    property color c2: "#ffffff"
    //property string ff:"Rounded Sans Serifs"
    property string ff:"Helvetica Neue"

    Rectangle{
        radius: 40
        width: parent.width
        height: parent.height/3.5
        opacity: 1
        anchors.top: parent.top

        MouseArea {
            opacity: 1
            anchors.fill: parent
            anchors.bottomMargin: -43

            onPressed: {
                previousX = mouseX
                previousY = mouseY
            }
            onMouseXChanged: {
                var dx = mouseX - previousX
                mainWindow.setX(mainWindow.x + dx)
            }
            onMouseYChanged: {
                var dy = mouseY - previousY
                mainWindow.setY(mainWindow.y + dy)
            }
        }
    }

    Rectangle {
        id: maini
        x: 0
        y: 0
        radius: 20
        width: 250
        height: parent.height
        opacity: 1
        border.width: 0
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: c1
            }
            GradientStop {
                position: 1
                color: c2
            }
        }

        RoundButton {
            id: roundButton
            x: 195
            y: 8
            width: 20
            height: 20
            visible: true

            text: "—"
            font.pointSize: 13
            font.family: ff
            layer.mipmap: false
            layer.enabled: false
            layer.format: ShaderEffectSource.RGBA
            focusPolicy: Qt.ClickFocus
            clip: false
            highlighted: false
            flat: false
            onClicked:mainWindow.showMinimized()

            QtObject{
                id:object1
                property string colorDefult :"#1f1f1f1f"
                property var dynamicColor: if(roundButton){
                                               roundButton.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 7
                color: object1.dynamicColor
            }
        }

        RoundButton {
            id: roundButton1
            x: 221
            y: 8
            width: 20
            height: 20
            visible: true
            radius: 7
            text: "X"
            font.pointSize: 12
            clip: false
            layer.format: ShaderEffectSource.RGBA
            layer.mipmap: false
            flat: false
            font.family: ff
            focusPolicy: Qt.ClickFocus
            //spacing: 9
            highlighted: false
            layer.enabled: false
            onClicked:Qt.quit()
            QtObject{
                id:object2
                property string colorDefult :"#1f1f1f1f"
                property var dynamicColor: if(roundButton1){
                                               roundButton1.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 7
                color: object2.dynamicColor
            }

        }

        Text {
            id: ans
            x: 8
            y: 28
            width: 234
            height: 53
            color: "#000000"
            text: anser

            fontSizeMode: Text.Fit
            minimumPixelSize: 5
            font.pixelSize: 45

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            //font.styleName: "Bold"
            font.family: ff
            Rectangle {
                id: screen1
                x: 99
                y: 22
            }

        }

        TextInput {
            id: form
            x: 8
            y: 78
            width: 227
            height: 20
            color: "#99000000"
            text: formula
            maximumLength:27
            selectByMouse :true
            focus: true
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.family: ff
            font.pixelSize: 15

            onTextChanged: {

            }
        }

        RoundButton {
            id: clear
            x: 126
            y: 104
            width: 57
            height: 47
            opacity: 1
            visible: true
            radius: 15
            text: qsTr("AC")
            highlighted: false
            flat: false
            font.family: ff
            font.pointSize: 15
            onPressed:{
                formula = ""
                anser = "0"
            }
            QtObject{
                id:object3
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(clear){
                                               clear.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object3.dynamicColor
            }
        }

        RoundButton {
            id: back
            x: 185
            y: 104

            width: 57
            height: 47
            radius: 15
            text: qsTr("⌫")
            //font.bold: true
            font.pointSize: 20
            font.family: ff
            onPressed:{

            }
            QtObject{
                id:object4
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(back){
                                               back.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object4.dynamicColor
            }
        }

        RoundButton {
            id: equal
            x: 67
            y: 104
            width: 57
            height: 47
            radius: 15
            text: qsTr("=")
            //font.bold: true
            font.family: ff
            font.pointSize: 17
            QtObject{
                id:object5
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(rbrack){
                                               rbrack.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object5.dynamicColor
            }
            onClicked: {

            }
        }

        RoundButton {
            id: percentage
            x: 8
            y: 104
            width: 57
            height: 47
            radius: 15
            text: qsTr("%")
            //font.bold: true
            font.family: ff
            font.pointSize: 17
            QtObject{
                id:object6
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(lbrack){
                                               lbrack.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object6.dynamicColor
            }
            onPressed:{

            }
        }

        RoundButton {
            id: divide
            x: 185
            y: 153
            width: 57
            height: 47
            radius: 15
            text: qsTr("÷")
            font.pointSize: 25
            font.family: ff
            QtObject{
                id:object7
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(divide){
                                               divide.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object7.dynamicColor
            }
            onPressed:{

            }
        }

        RoundButton {
            id: nine
            x: 126
            y: 153
            width: 57
            height: 47
            radius: 15
            text: qsTr("9")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object8
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(nine){
                                               nine.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object8.dynamicColor
            }
            onPressed:{

            }
        }

        RoundButton {
            id: eight
            x: 67
            y: 153
            width: 57
            height: 47
            radius: 15
            text: qsTr("8")
            highlighted: false
            flat: false
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object9
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(eight){
                                               eight.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object9.dynamicColor
            }
            onPressed:{

            }
        }

        RoundButton {
            id: seven
            x: 8
            y: 153
            width: 57
            height: 47
            radius: 15
            text: qsTr("7")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object10
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(seven){
                                               seven.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object10.dynamicColor
            }
            onPressed:{

            }
        }

        RoundButton {
            id: multiply
            x: 185
            y: 202
            width: 57
            height: 47
            radius: 15
            text: qsTr("X")
            font.pointSize: 17
            font.family: ff
            QtObject{
                id:object11
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(multiply){
                                               multiply.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object11.dynamicColor
            }
            onPressed:{

            }
        }

        RoundButton {
            id: six
            x: 126
            y: 202
            width: 57
            height: 47
            radius: 15
            text: qsTr("6")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object12
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(six){
                                              six.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object12.dynamicColor
            }
            onPressed:{

            }
        }

    }
}
