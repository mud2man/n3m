#!/bin/bash

sudo service postgresql start &
cd /home/n3m/git
if [ ! -d "./n3m" ]; then
  source /home/n3m/.bashrc
  mkdir /home/n3m/.vimundo
  git clone https://github.com/team-n3m/n3m.git
  cd n3m
  virtualenv venv
  . venv/bin/activate 
  pip install -r requirements.txt
  sudo -H -u postgres bash -c "createuser -r -s -d --replication n3m"
  creaetdb n3mdb
  python manage.py create_db
  python manage.py n3mdb upgrade
  python manage.py n3mdb migrate 
  cd static
  npm install
else
  cd n3m
  . venv/bin/activate 
fi

exec $@

