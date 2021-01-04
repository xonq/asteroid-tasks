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

    property var keys: Object.keys(taskObj)
    property date currentDate: new Date()
    property int year: currentDate.getFullYear()
    property int month: currentDate.getMonth()+1
    property int day: currentDate.getDate()
    property string passDate: year.toString() + month.toString() + day.toString()
 //   property string writeDate: year.toString() + '/' + month.toString() + '/' + day.toString()

    // make change color if tasks are done
    centerColor: "#cc66ff"
    outerColor: "#6600cc"

    // components to call from each list item
    Component { id: floatLayer;      FloatPage      { } }
    Component { id: dateLayer;       DatePage       { } }
    Component { id: binaryLayer;     BinaryPage     { } }
    Component { id: aboutLayer;      AboutPage      { } }
//    Component { id: dataLayer;       DataView       { } }

    // NEED FOR these will be defined in c++
    property var taskObj: jedt.addToday(dataObj, passDate)
    property var todayArr: taskObj[passDate]
    property var dateKeys: taskObj.keys()

    property var inLength: todayArr.length
    property var passArr: null
    property var passIndex: null


    LayerStack {
        id: layerStack
        firstPage: firstPageComponent
    }
    Component {
        id: firstPageComponent

        Flickable {

            contentHeight: (inLength + 6)*Dims.h(16) + (DeviceInfo.hasRoundScreen ? Dims.h(20) : 0)
            contentWidth: width
            boundsBehavior: Flickable.DragOverBounds
            flickableDirection: Flickable.VerticalFlick

            Column {
                anchors.fill: parent

                Item { width: parent.width; height: DeviceInfo.hasRoundScreen ? Dims.h(10) : 0 }

                signal sendMessage(string icon)

                ListItem {
                    //% "ACTUALDATE"
                    title: qsTrId(passDate)
                }

                ListItem {
                    //% "PRACTICE"
                    title: qsTrId(todayArr[0][0])
                    iconName: todayArr[0][5]
                    onClicked: {
                        passArr = todayArr[0];
                        passIndex = 0
                        layerStack.push(floatLayer);
                    }
                }
                ListItem {
                    //% "FLOSS"
                    title: qsTrId(todayArr[1][0])
                    iconName: todayArr[1][5]
                    onClicked: {
                        passArr = todayArr[1];
                        passIndex = 1
                        layerStack.push(binaryLayer);
                    }
                }
                    //% "EXERCISE"
                ListItem {
                    title: qsTrId(todayArr[2][0])
                    iconName: todayArr[2][5]
                    onClicked: {
                        passArr = todayArr[2];
                        passIndex = 2
                        layerStack.push(floatLayer);
                    }
                }
                //% "READ"
                ListItem {
                    title: qsTrId(todayArr[3][0])
                    iconName: todayArr[3][5]
                    onClicked: {
                        passArr = todayArr[3];
                        passIndex = 3
                        layerStack.push(floatLayer);
                    }
                }
                //% "WORK"
                ListItem {
                    title: qsTrId(todayArr[4][0])
                    iconName: todayArr[4][5]
                    onClicked: {
                        passArr = todayArr[4];
                        passIndex = 4
                        layerStack.push(floatLayer);
                    }
                }
                //% "WALK"
                ListItem {
                    title: qsTrId(todayArr[5][0])
                    iconName: todayArr[5][5]
                    onClicked: {
                        passArr = todayArr[5];
                        passIndex = 5
                        layerStack.push(floatLayer);
                    }
                }
                //% "IRON"
                ListItem {
                    title: qsTrId(todayArr[6][0])
                    iconName: todayArr[6][5]
                    onClicked: {
                        passArr = todayArr[6];
                        passIndex = 6
                        layerStack.push(binaryLayer);
                    }
                }
                //% "SLEEP"
                ListItem {
                    title: qsTrId(todayArr[7][0])
                    iconName: todayArr[7][5]
                    onClicked: {
                        passArr = todayArr[7];
                        passIndex = 7
                        layerStack.push(floatLayer);
                    }
                }
                //% "BEER"
                ListItem {
                    title: qsTrId(todayArr[8][0])
                    iconName: todayArr[8][5]
                    onClicked: {
                        passArr = todayArr[8];
                        passIndex = 8
                        layerStack.push(floatLayer);
                    }
                }
                ListItem {
                    //% "OPTIONS"
                    title: qsTrId("OPT")
/*                    onClicked: {
                        layerStack.push(dataLayer)
                    }
*/                }
                ListItem {
                    //% "Date"
                    title: qsTrId("date")
                    iconName: "ios-calendar-outline"
                    onClicked: layerStack.push(dateLayer)
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
