#!/bin/sh

set -e

python manage.ppy wait_for_db
python manage.py collesctstatic --noinput
python manage.py migrate

uwsgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi