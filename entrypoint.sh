#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
echo "SUPER_SECRET: ${MY_SECRET_VALUE:-not found}"
echo "SUPER_SECRETS: ${MY_SECRET_VALUE:-not found}"
echo 'Env data in entrypoint are:'
env
echo 'Arg data are:'
echo "$@"
echo 'Current Dir Structure:'
ls -la
echo 'Current Path:'
pwd
echo 'PHP info (from entrypoint):'
php -i
echo 'Run script:'
php /app/release-qiita.php $@
