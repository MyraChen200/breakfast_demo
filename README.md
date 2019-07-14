# breakfast_demo


Written in Django 2.2, Python 3.7

Mysql as DB:
* Using the dumpfile breakfast_demo.sql

## Setup environment]

### Install/Setup venv
Got your console running with venv environment
```bash
python3 -m venv pyvenv
source pyvenv/bin/activate
```

### Install require packages
Install required packages
```bash
pip install -r requirements.txt
```

### Load a fixtures into database
```bash
cd django
./manage.py loaddata fixtures/*.json
```

### Run server for develop
```bash
cd django
./manage.py runserver
```
