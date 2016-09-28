#!/bin/bash

cd /home/n3m/git
if [ ! -d "./n3m" ]; then
  git clone https://github.com/team-n3m/n3m.git
  cd n3m
  virtualenv venv
  . venv/bin/activate 
  pip install -r requirements.txt
else
  cd n3m
  . venv/bin/activate 
fi

sudo service postgresql start &
sh run.sh
exec $@

