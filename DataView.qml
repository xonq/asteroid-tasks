import QtQuick 2.0
import org.asteroid.controls 1.0
import org.asteroid.utils 1.0


Item {
    id: root

    ListModel {
        id: weekTable
        ListElement {
            row1: taskObj[dateKeys[0]][0][0]
            row2: taskObj[dateKeys[0]][1][0]
            row3: taskObj[dateKeys[0]][2][0]
            row4: taskObj[dateKeys[0]][3][0]
            row5: taskObj[dateKeys[0]][4][0]
            row6: taskObj[dateKeys[0]][5][0]
            row7: taskObj[dateKeys[0]][6][0]
            row8: taskObj[dateKeys[0]][7][0]
            row9: taskObj[dateKeys[0]][8][0]
        }
        ListElement {
            row1: taskObj[dateKeys[0]][0][4]
            row2: taskObj[dateKeys[0]][1][4]
            row3: taskObj[dateKeys[0]][2][4]
            row4: taskObj[dateKeys[0]][3][4]
            row5: taskObj[dateKeys[0]][4][4]
            row6: taskObj[dateKeys[0]][5][4]
            row7: taskObj[dateKeys[0]][6][4]
            row8: taskObj[dateKeys[0]][7][4]
            row9: taskObj[dateKeys[0]][8][4]
        }
        ListElement {
            row1: taskObj[dateKeys[1]][0][4]
            row2: taskObj[dateKeys[1]][1][4]
            row3: taskObj[dateKeys[1]][2][4]
            row4: taskObj[dateKeys[1]][3][4]
            row5: taskObj[dateKeys[1]][4][4]
            row6: taskObj[dateKeys[1]][5][4]
            row7: taskObj[dateKeys[1]][6][4]
            row8: taskObj[dateKeys[1]][7][4]
            row9: taskObj[dateKeys[1]][8][4]
        }
    }

    TableView {
        TableViewColumn {
            role: "row1"
            title: taskObj[dateKeys[0]][0][0]
            width: parent.width
        }
    model: weekTable
    }
}
