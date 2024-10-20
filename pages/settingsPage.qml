import QtQuick 6.2
import QtQuick.Controls

Page {
    id: settingsPage
    title: "Settings"

    Column {
        anchors.centerIn: parent

        Text {
            text: "Under Development"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Button {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        text: "Back"
         onClicked: stackView.replace("qrc:/pages/startPage.qml")
    }
}
