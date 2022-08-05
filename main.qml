import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Calculator 1.0

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
    property string finalResult: "0"
    property string textOnScreen: ""
    property color c1: "#FFE4E1"
    property color c2: "#F0FFFF"
    property string ff:"Helvetica Neue"

    Calculator{
        id: logic
    }

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
            text: finalResult

            fontSizeMode: Text.Fit
            minimumPixelSize: 5
            font.pixelSize: 45

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
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
            text: textOnScreen
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
            x: 8
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
                textOnScreen = ""
                finalResult = "0"
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
            font.pointSize: 20
            font.family: ff
            onPressed:{
                    textOnScreen = textOnScreen.slice(0, -1)
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
            x: 185
            y: 300
            width: 57
            height: 47
            radius: 15
            text: qsTr("=")
            font.family: ff
            font.pointSize: 17
            QtObject{
                id:object5
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(equal){
                                               equal.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object5.dynamicColor
            }
            onClicked: {
                finalResult = logic.result(textOnScreen)
                if(textOnScreen == "")
                {
                    finalResult = "0"
                }
            }
        }

        RoundButton {
            id: percentage
            x: 67
            y: 104
            width: 57
            height: 47
            radius: 15
            text: qsTr("%")
            font.family: ff
            font.pointSize: 17
            QtObject{
                id:object6
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(percentage){
                                               percentage.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object6.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: divide
            x: 126
            y: 104
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
                    textOnScreen = textOnScreen+"/"
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
                property string colorDefult :  "#0a0a0a0a"
                property var dynamicColor: if(nine){
                                               nine.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object8.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
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
                                               eight.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object9.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
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
                                               seven.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object10.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: multiply
            x: 185
            y: 153
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
                    textOnScreen = textOnScreen + "*"
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
                                              six.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object12.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: five
            x: 67
            y: 202
            width: 57
            height: 47
            radius: 15
            text: "5"
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object13
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(five){
                                              five.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object13.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: four
            x: 8
            y: 202
            width: 57
            height: 47
            radius: 15
            text: qsTr("4")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object14
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(four){
                                              four.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object14.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: minus
            x: 185
            y: 202
            width: 57
            height: 47
            radius: 15
            text: qsTr("—")
            font.pointSize: 17
            font.family: ff

            QtObject{
                id:object15
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(minus){
                                               minus.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object15.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + "-"
            }
        }

        RoundButton {
            id: three
            x: 126
            y: 251
            width: 57
            height: 47
            radius: 15
            text: qsTr("3")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object16
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(three){
                                              three.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object16.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: two
            x: 67
            y: 251
            width: 57
            height: 47
            radius: 15
            text: qsTr("2")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object17
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(two){
                                              two.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object17.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: one
            x: 8
            y: 251
            width: 57
            height: 47
            radius: 15
            text: qsTr("1")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object18
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(one){
                                              one.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object18.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: plus
            x: 185
            y: 251
            width: 57
            height: 47
            radius: 15
            text: qsTr("+")
            font.pointSize: 22
            font.family: ff
            QtObject{
                id:object19
                property string colorDefult :"#1f1f1f1f"
                property var dynamicColor: if(plus){
                                              plus.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object19.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + "+"
            }
        }

        RoundButton {
            id: decimal
            x: 126
            y: 300
            width: 57
            height: 47
            radius: 15
            text: qsTr(".")
            font.family: ff
            font.pointSize: 30
            QtObject{
                id:object20
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(decimal){
                                              decimal.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object20.dynamicColor
            }
            onPressed:{
                    textOnScreen = textOnScreen + text
            }
        }

        RoundButton {
            id: zero
            x: 8
            y: 300
            width: 116
            height: 47
            radius: 15
            text: qsTr("0")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:object21
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(zero){
                                              zero.down ? "#E6E6FA":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: object21.dynamicColor
            }
            onPressed:{
                  textOnScreen = textOnScreen + text
            }
        }

    }
}
