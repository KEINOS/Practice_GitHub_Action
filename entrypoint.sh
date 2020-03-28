#!/bin/sh -l

[ "${MY_SECRET_VALUE:+dummy}" ] || {
    echo 'No MY_SECRET_VALUE ENV variable set. Please set your access token to MY_SECRET_VALUE env variable.'
    exit 1
}

php /app/action.php "$@"
