import QtQuick 6.0
import QtQuick.Controls 6.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Test Application"

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: "qrc:/pages/startPage.qml"
    }

}
