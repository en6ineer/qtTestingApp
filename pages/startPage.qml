import QtQuick 6.2
import QtQuick.Controls 6.0
import QtQuick.Shapes

    Page {
        title: "Welcome"

        Rectangle {
            id: backgroundRect
            anchors.fill: parent

            SequentialAnimation {
                id: rainbowAnimation
                loops: Animation.Infinite

                ColorAnimation {
                    target: backgroundRect
                    property: "color"
                    duration: 2000
                    to: "red"
                }

                ColorAnimation {
                    target: backgroundRect
                    property: "color"
                    duration: 2000
                    to: "orange"
                }

                ColorAnimation {
                    target: backgroundRect
                    property: "color"
                    duration: 2000
                    to: "yellow"
                }

                ColorAnimation {
                    target: backgroundRect
                    property: "color"
                    duration: 2000
                    to: "green"
                }

                ColorAnimation {
                    target: backgroundRect
                    property: "color"
                    duration: 2000
                    to: "cyan"
                }

                ColorAnimation {
                    target: backgroundRect
                    property: "color"
                    duration: 2000
                    to: "blue"
                }

                ColorAnimation {
                    target: backgroundRect
                    property: "color"
                    duration: 2000
                    to: "purple"
                }
            }

            Rectangle{

                anchors.centerIn: parent
                height: 200
                width: 200
                color: "white"
                radius: 15

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    text: "Welcome"
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    color: "grey"
                }

                Button {
                    text: "Start Testing"
                    onClicked: stackView.push("qrc:/pages/testPage.qml")
                }

                Button {
                    text: "Settings"
                    onClicked: stackView.push("qrc:/pages/settingsPage.qml")
                }
            }
            }
        }

        Component.onCompleted: {
            rainbowAnimation.running = true
        }
    }

