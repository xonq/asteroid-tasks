/*
 * Copyright (C) 2016 - Sylvia van Os <iamsylvie@openmailbox.org>
 * Copyright (C) 2015 - Florent Revest <revestflo@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import org.asteroid.controls 1.0
import org.nemomobile.systemsettings 1.0

Item {
//    DisplaySettings { id: displaySettings }
    id: root
    property var pop

    PageHeader {
        id: title
        text: qsTrId(passArr[4].toString())
    }

    Icon {
        width: Dims.w(25)
        height: width
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -Dims.h(15)
// NEED TO MAKE AN INPUT
        name: passArr[5]
    }

    Label {
        //% "Binary %1%"
        text: qsTrId(passArr[0])
        font.pixelSize: Dims.l(6)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.left: parent.left; anchors.right: parent.right
        anchors.leftMargin: Dims.w(2); anchors.rightMargin: Dims.w(2)
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: Dims.h(10)
    }

    IconButton {
        iconName: "ios-remove-circle-outline"
        edge: undefinedEdge
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -Dims.w(15)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Dims.h(10)
        onClicked: {
            jedt.setJdata(taskObj)
            taskObj = jedt.editJdata(taskObj, passDate.toString(), passIndex.toString(), "0");
            root.pop();
        }
    }

    IconButton {
        width: Dims.w(20)
        height: width
        iconName: "ios-add-circle-outline"
        edge: undefinedEdge
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: Dims.w(15)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Dims.h(10)
        onClicked: {
            jedt.setJdata(taskObj)
            taskObj = jedt.editJdata(taskObj, passDate.toString(), passIndex.toString(), "1");
            root.pop();
        }
    }
}

