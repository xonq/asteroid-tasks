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



Item {
    id: root
    property var pop

    PageHeader {
        id: title
        text: qsTrId(passArr[4].toString() + '\t' + passArr[3])
    }

    Row {
        id: timeSelector
        anchors.top: title.bottom
        height: Dims.h(60)
        width: parent.width

        property int spinnerWidth: width/2

        CircularSpinner {
            id: integerLV
            height: parent.height
            width: parent.spinnerWidth
            model: 100
            showSeparator: true
//            delegate: SpinnerDelegate { text: (index == 0) ? "0" : ("0" + index).slice(-2) }
        }
        CircularSpinner {
            id: decimalLV
            height: parent.height
            width: parent.spinnerWidth
            model: 100
            showSeparator: false
        }
        //NEED PUT THE UNITS HERE IF I WANT
    }
    IconButton {
        iconName: "ios-remove-circle-outline"
        edge: undefinedEdge
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -Dims.w(15)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Dims.h(10)
        onClicked: {
            var integer = integerLV.currentIndex;
            var decimal = decimalLV.currentIndex;
            var newValue = integer.toString() + "." + decimal.toString();
            var passValue = parseFloat(passArr[4]) - parseFloat(newValue);
            jedt.setJdata(taskObj)
            taskObj = jedt.editJdata(taskObj, passDate.toString(), passIndex.toString(), passValue.toString());
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
            var integer = integerLV.currentIndex;
            var decimal = decimalLV.currentIndex;
            var newValue = integer.toString() + "." + decimal.toString();
            var passValue = parseFloat(passArr[4]) + parseFloat(newValue);
            jedt.setJdata(taskObj)
            taskObj = jedt.editJdata(taskObj, passDate.toString(), passIndex.toString(), passValue.toString());
            root.pop();
        }
    }
}
