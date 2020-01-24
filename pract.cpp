# include <string>
# include <vector>
# include <iostream>
# include <QFile>
# include <QIODevice>
# include <QJsonDocument>
# include <QTextStream>
# include <QJsonObject>
# include <QJsonArray>
# include <QVariantMap>
# include <QVariantList>
# include <QStringList>

	using namespace std;

int main(){

	cout << "hello" << endl;

    QFile file_obj("/zhole/software/practice/json/template.json");

//convert to make empty json for initialization
    if(! file_obj.open(QIODevice::ReadOnly)) {
        cout << "failed" << endl;
		exit( 1 );
    }

    QTextStream file_text(&file_obj);
    QString json_string;
    json_string = file_text.readAll();
    file_obj.close();
    QByteArray json_bytes = json_string.toLocal8Bit();

    auto json_doc = QJsonDocument::fromJson(json_bytes);

    if(json_doc.isArray()){
       cout << "file is array" << endl;
    }

    QJsonObject json_obj = json_doc.object();

//initialization of empty file - or return an exit code for a new particular main screen
    if(json_obj.isEmpty()){
        cout << "empty" << endl;
        exit( 3 );
    }

// NEED TO GRAB THIS DATE FROM CALENDAR
    QString today = "99/01/30";
    QJsonObject today_obj = json_obj[today].toObject();

// NEED TO ERROR CHECK IF THE DATE IS SYNC'ED, perhaps just print it up top
// NEED TO CHANGE TO COPY PREVIOUS DATE/INITIALIZE AND SAVE IN date_obj
    if(today_obj.isEmpty()){
        cout << "failed to populate today" << endl;
        exit( 4 );
    }

// NEED TO ADD AND DETERMINE DUE
    QStringList task_list = today_obj.keys();
    for(int i = 0; i < task_list.count(); ++ i){
        QJsonArray
    }

}

