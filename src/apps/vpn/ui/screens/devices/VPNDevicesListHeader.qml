/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.5
import QtQuick.Layouts 1.14

import Mozilla.Shared 1.0
import components 0.1

Item {
    id: listHeader
    objectName: "deviceLimitHeader"

    property bool pendingDeviceRemoval: false

    Layout.fillWidth: true
    states: [
        State {
            when: vpnFlickable.state === "deviceLimit" || vpnFlickable.wasmShowMaxDeviceWarning === true

            PropertyChanges {
                target: listHeader
                height: spacer.height * 2 + vpnPanel.height
                opacity: 1
            }

        },
        State {
            when: vpnFlickable.state === "active"

            PropertyChanges {
                target: listHeader
                height: 0
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

    Rectangle {
        id: spacer

        anchors.top: listHeader.top
        height: MZTheme.theme.windowMargin * 2
        width: listHeader.width
        color: MZTheme.theme.transparent
    }

    MZPanel {
        id: vpnPanel
        objectName: "deviceLimitPanel"
        anchors.top: spacer.bottom
        logoSize: 80
        logo: "qrc:/ui/resources/devicesLimit.svg"
        //% "Remove a device"
        logoTitle: qsTrId("vpn.devices.doDeviceRemoval")
        //% "You’ve reached the device limit. To turn on the VPN on this device, you’ll need to remove one."
        logoSubtitle: qsTrId("vpn.devices.maxDevicesHeader")

    }

    Rectangle {
        id: bottomSpacer

        anchors.top: vpnPanel.bottom
        height: MZTheme.theme.windowMargin * 2
        width: listHeader.width
        color: MZTheme.theme.transparent
    }

}
