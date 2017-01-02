#!/bin/bash
set -e
if [ "$ENV" = "DEV" ];then
    echo "Running as dev"
    exec python "identidock.py"
else
    echo "Running as prod"
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app 0.0.0.0:9191
fi
