#!/bin/bash

sudo apt-get install graphite-web
sudo apt-get install graphite-carbon

sudo cp local_settings.py /etc/graphite/local_settings.py

sudo -u _graphite graphite-manage syncdb --noinput

sudo cp graphite-carbon /etc/default/graphite-carbon
sudo cp storage-schemas.conf /etc/carbon/storage-schemas.conf

sudo service carbon-cache start
sudo apt-get install nginx
sudo cp server.conf nano /etc/nginx/sites-enabled/server.conf

sudo apt-get install uwsgi uwsgi-plugin-python

sudo cp grafite.ini /etc/uwsgi/apps-enabled/grafite.ini

sudo service nginx restart
sudo service uwsgi restart