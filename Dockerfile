# Container image that runs the code in ./src directory by GitHub Actions
FROM php:7.4.4-alpine

COPY entrypoint.sh /entrypoint.sh
COPY ./src /app

WORKDIR /app
RUN \
    apk --no-cache add \
        # Required for PHP Composer in order to download the packages
        git \
        # Install for maintenance
        tree \
        # Required to set Time Zone for Japan
        tzdata \
    # Set time zone to Janan's time
    && echo 'Asia/Tokyo' > /etc/timezone \
    # Download PHP Composer
    && /app/install-bin-composer.sh \
    # Install composer packages of the PHP script's dependencies
    && composer install

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
