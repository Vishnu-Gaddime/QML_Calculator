import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Window {
    width: 400
    height: 400
    visible: true
    title: qsTr("Calculator")


    ColumnLayout{
        anchors.fill: parent;
        anchors.margins: 10

        TextField{
            Layout.fillWidth: true;
            font.pixelSize: 30
            horizontalAlignment: TextInput.AlignRight

            background: Rectangle{
                color: "white"
                radius: 5
                border.color: "black"
            }
            readOnly: true
        }

        GridLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            columns: 4

            Repeater{
                model: ["A/C","%","+/-","/","7","8","9","*","4","5","6","-","1","2","3","+","0",".","="]

                Button{
                    text: modelData
                    implicitHeight: 20
                    implicitWidth: 80
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    contentItem: Text {
                        text: modelData
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}
