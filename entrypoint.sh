#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
echo "SUPER_SECRET: ${MY_SECRET_VALUE:-not found}"
echo 'Env data in entrypoint are:'
env
echo 'Arg data are:'
echo "$@"
echo 'Current Dir Structure:'
ls -la
echo 'Tree:'
tree -d /
echo 'Current Path:'
pwd
echo 'PHP info (from entrypoint):'
php -i
echo 'Run script:'
php /app/action.php "$@"
