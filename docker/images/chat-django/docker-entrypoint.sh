#!/bin/bash

USER_ID=${LOCAL_USER_ID:-1000}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user

if [ "$APP_DATABASE_WAIT" == true ]; then
    while true
    do
        echo 'Database is unavailable - sleeping'
        sleep 1
        if gosu user python manage.py check_db_connection
        then
            break
        fi
    done
fi

if [ "$APP_DATABASE_MIGRATE" == true ]; then
    gosu user python manage.py migrate
fi

gosu user "$@"
