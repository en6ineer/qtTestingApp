import QtQuick 6.2
import QtQuick.Controls 6.0



    Page {
        id: startTestingPage
        title: "Start Testing"

        Column {
            spacing: 20
            anchors.fill: parent
            anchors.margins: 20

            ScrollView {
                height: 200
                width: parent.width

                Text {
                    text: "This is where the question will be displayed. The text can be very long, so it's placed inside a ScrollView."
                    wrapMode: Text.WordWrap
                }
            }

            Column {
                spacing: 10

                CheckBox {
                    text: "Option 1"
                }

                CheckBox {
                    text: "Option 2"
                }

                CheckBox {
                    text: "Option 3"
                }
            }

            Button {
                text: "Submit Answer"
            }
        }

        Button {
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            text: "Exit"
             onClicked: stackView.replace("qrc:/pages/startPage.qml")
        }
    }
