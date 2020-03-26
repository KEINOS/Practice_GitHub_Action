#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
echo 'Env data are are:'
env
echo "SUPER_SECRET: ${super_secret:-not found}"
echo "SUPER_SECRETS: ${super_secrets:-not found}"
