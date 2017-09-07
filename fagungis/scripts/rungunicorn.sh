#!/bin/bash
set -e
# go in your project root
cd %(django_project_root)s
# set PYTHONPATH to cwd
export PYTHONPATH=`pwd`
export DJANGO_SETTINGS_MODULE=%(project)s.settings
# activate the virtualenv
source %(virtenv)s/bin/activate
# start gunicorn with all options earlier declared in fabfile.py
exec  %(virtenv)s/bin/gunicorn %(project)s.wsgi:application -w %(gunicorn_workers)s \
    --user=%(django_user)s --group=%(django_user_group)s \
    --bind=%(gunicorn_bind)s --log-level=%(gunicorn_loglevel)s \
    --log-file=%(gunicorn_logfile)s 2>>%(gunicorn_logfile)s



