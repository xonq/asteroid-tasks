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
import org.asteroid.utils 1.0

Application {
    id: app

    centerColor: "#cc66ff"
    outerColor: "#6600cc"

    Component { id: timeLayer;       TimePage       { } }
    Component { id: dateLayer;       DatePage       { } }
    Component { id: brightnessLayer; BrightnessPage { } }
    Component { id: aboutLayer;      AboutPage      { } }

    LayerStack {
        id: layerStack
        firstPage: firstPageComponent
    }

    Component {
        id: firstPageComponent

        Flickable {
            function elementsNb() {
                var nb = 9;
                if(DeviceInfo.hasSpeaker) nb ++
                return nb;
            }
            contentHeight: elementsNb()*Dims.h(16) + (DeviceInfo.hasRoundScreen ? Dims.h(20) : 0)
            contentWidth: width
            boundsBehavior: Flickable.DragOverBounds
            flickableDirection: Flickable.VerticalFlick

            Column {
                anchors.fill: parent

                Item { width: parent.width; height: DeviceInfo.hasRoundScreen ? Dims.h(10) : 0 }

                ListItem {
                    //% "DUE"
                    title: qsTrId("DUE")
                }
                ListItem {
                    //% "Time"
                    title: qsTrId("practice")
                    iconName: "xonq-yinyang"
                    onClicked: layerStack.push(timeLayer)
                }
                ListItem {
                    //% "Brightness"
                    title: qsTrId("flossing")
                    iconName: "tooth"
                    onClicked: layerStack.push(brightnessLayer)
                }
                ListItem {
                    //% "ALL"
                    title: qsTrId("ALL")
                }
                ListItem {
                    //% "Date"
                    title: qsTrId("date")
                    iconName: "ios-calendar-outline"
                    onClicked: layerStack.push(dateLayer)
                }
                ListItem {
                    //% "OPTIONS"
                    title: qsTrId("OPT")
                }

                ListItem {
                    //% "Add"
                    title: qsTrId("add")
                    iconName: "ios-add-circle-outline"
                }
                ListItem {
                    //% "Remove"
                    title: qsTrId("rem")
                    iconName: "ios-remove-circle-outline"
                }
                ListItem {
                    //% "About"
                    title: qsTrId("about")
                    iconName: "ios-code"
                    onClicked: layerStack.push(aboutLayer)
                }

                Item { width: parent.width; height: DeviceInfo.hasRoundScreen ? Dims.h(10) : 0 }


            }
        }
    }
}
