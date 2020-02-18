# asteroid-tasks

goal tracking app for the open source smartwatch OS, Asteroid OS (https://github.com/AsteroidOS)

# Getting Started

`template.json` must be copied to `/home/ceres/tasks/template.json`
```
sftp ceres@192.168.2.15
mkdir /home/ceres/tasks
put .../asteroid-tasks/json/template.json /home/ceres/tasks
```

Look at format to create tasks as add/rem app functions do not work yet.

# overview

json: ` { date: [ [ $NAME, $X, $TYPE, $UNIT, $VALUE, $ICON, $X ] ], ... "template": [...] }`
app opens, json loads, if the current date does not exist then copy the template.
tasks are binary or floats
