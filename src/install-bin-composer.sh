#!/bin/sh -l

# =============================================================================
#  Download PHP Composer
# =============================================================================
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
if [ $? -ne 0 ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    exit 1
fi
rm composer-setup.php

# =============================================================================
#  Install Composer
# =============================================================================
path_file_composer="$(dirname $(which php))/composer"
mv ./composer.phar "${path_file_composer}" && chmod +x "${path_file_composer}"
composer --version

# =============================================================================
#  Install Dependencies
# =============================================================================
# Comment-in the below to install dependencies here. But it is suggested to
# install them in Dockerfile's RUN directive.
#composer install
