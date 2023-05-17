#!/bin/sh

set -e
python manage.py collectstatic --noinput
python manage.py wait_for_db

echo "${0}: running migrations."
python manage.py makemigrations --merge
python manage.py migrate --noinput

uwsgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi
