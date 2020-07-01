FROM php:8.0-rc

RUN apt-get update \
    && apt-get install -y --no-install-recommends libfreetype6-dev libjpeg-dev libpng-dev libwebp-dev  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/inclue/ --with-webp-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && apt-get install -y --no-install-recommends libgmp-dev \
    && docker-php-ext-install gmp \
    && docker-php-ext-enable opcache \
    && docker-php-ext-install zip \
    && docker-php-ext-install bcmath \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear/
