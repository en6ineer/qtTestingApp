import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Dialogs

Page {
    id: settingsPage
    title: "Settings"

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: "Under Development"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            text: "Load questions"
            onClicked: fileDialog.open()
        }

        Button {
            text: "Clear statistics"
        }
    }

    Button {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        text: "Back"
        onClicked: stackView.replace("qrc:/pages/startPage.qml")
    }

    FileDialog {
        id: fileDialog
        title: "Select a questions file"
        fileMode: FileDialog.OpenFile
        nameFilters: ["Text files (*.txt)"]
        onAccepted: {
            console.log("Selected file: " + selectedFile)
            db.loadQuestions(selectedFile)  // Вызов метода C++ класса
        }
    }
}
