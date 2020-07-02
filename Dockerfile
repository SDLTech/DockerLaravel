FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y

ENV TZ=Australia/Brisbane
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

RUN apt-get install -y \
    wget \
    curl \
    zip \
    unzip \
    apache2

RUN apt-get update -y

RUN apt-get install -y \
    php \
    php-fpm \
    php-json \
    php-pdo \
    php-zip \
    php-pear \
    php-bcmath \
    libapache2-mod-php \
    php-cli \
    php-curl \
    php-mysql \
    php-gd \
    php-xml \
    php-mbstring \
    php-iconv

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

#RUN composer create-project --prefer-dist laravel/laravel lara_app

RUN composer Install

#COPY apache-conf /etc/apache2/apache2.conf

RUN service apache2 start

EXPOSE 80

CMD apachectl -D FOREGROUND