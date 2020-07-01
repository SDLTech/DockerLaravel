FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade

RUN apt-get install -y \
    wget \
    curl \
    zip \
    unzip \
    apache2

RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y \
    php7.4 php7.4-fpm \
    libapache2-mod-php7.0 \
    php7.4-cli \
    php7.4-curl \
    php7.4-mysql \
    php7.4-sqlite3 \
    php7.4-gd \
    php7.4-xml \
    php7.4-mcrypt \
    php7.4-mbstring \
    php7.4-iconv

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
RUN composer create-project --prefer-dist laravel/laravel lara_app

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www
