import QtQuick 2.0
import Mozilla.VPN 1.0

Rectangle {
    property var pendingDeviceRemoval: false
    id: listHeader
    width: deviceList.width
    color: "transparent"

    Rectangle {
        id: deviceLimitAlert
        anchors.fill: parent
        anchors.topMargin: 32
        color: "transparent"

        Image {
            id: alertImg
            source: "../resources/devicesLimit.svg"
            sourceSize.width: 80
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
        }

        VPNHeadline {
            id: alertHeadline
            anchors.top: alertImg.bottom
            anchors.topMargin: 24
            text: qsTr("Remove a device")
        }

        VPNSubtitle {
            anchors.top: alertHeadline.bottom
            anchors.topMargin: 8
            text: qsTr("You've reached your limit. To install the VPN on this device, you'll need to remove one.")
        }
    }

    state: "deviceLimitNotReached"

    states: [
        State {
            name: "deviceLimitReached"
            when: deviceWrapper.state === "deviceLimit"
            PropertyChanges {
                target: listHeader
                height: 252
                opacity: 1
            }
        },
        State {
            name: "deviceLimitNotReached"
            when: deviceWrapper.state === "active"
            PropertyChanges {
                target: listHeader
                height: 8
                opacity: 0
                pendingDeviceRemoval: false
            }
        }

    ]
    transitions: [
        Transition {
            to: "deviceLimitNotReached"
            SequentialAnimation {
                PropertyAnimation {
                    property: "opacity"
                    duration: 200
                }
                PropertyAnimation {
                    property: "height"
                    duration: 300
                    easing.type: Easing.Linear
                }
            }
        }

    ]
}
