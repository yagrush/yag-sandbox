FROM php:8.1-fpm-buster as phpbase

ENV LANG ja_JP.UTF-8

RUN cat /etc/passwd | sed s/33/1000/g > /tmp/pwupdate && \
    mv /tmp/pwupdate /etc/passwd && \
    chmod 444 /etc/passwd

RUN cat /etc/group | sed s/33/1000/g > /tmp/pwgroup && \
    mv /tmp/pwgroup /etc/group

RUN apt-get update && apt-get install -y \
        libxml2-dev \
        python \
        supervisor \
        libpng-dev \
        lsyncd \
        rsyslog \
        procps \
        libldap2-dev \
        zip \
        unzip \
        vim \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so
RUN mkdir /var/php-fpm/

RUN pecl channel-update pecl.php.net

RUN pecl install apcu \
    && docker-php-ext-enable apcu

RUN pecl install redis \
    && docker-php-ext-enable redis

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo_mysql mysqli

RUN docker-php-ext-install intl

# RUN docker-php-ext-install soap

# RUN docker-php-ext-install opcache

# RUN docker-php-ext-install bcmath

COPY ./php.d/timezone.ini /usr/local/etc/php/conf.d
COPY ./php.d/logging.ini /usr/local/etc/php/conf.d

COPY ./php.d/apcu.ini /usr/local/etc/php/conf.d/apcu.ini
COPY ./php.d/php.ini /usr/local/etc/php/conf.d/php.ini

COPY ./php-fpm.d/status.conf /usr/local/etc/php-fpm.d
COPY ./php-fpm.d/zz-socket.conf /usr/local/etc/php-fpm.d

# ADD ./cron/crontab /var/spool/crontab/root
# ADD ./cron/run.sh /bin/run.sh

RUN curl -sS https://getcomposer.org/installer | php -- --version=2.7.2 --install-dir=/usr/local/bin --filename=composer


# ------------------------------------------------------------------------

# FROM phpbase

# RUN curl -L git.io/nodebrew | perl - setup

# ENV PATH /root/.nodebrew/current/bin:$PATH

# RUN nodebrew install-binary v12.13.0

# RUN nodebrew use v12.13.0

# RUN npm i -g yarn

# RUN crontab /var/spool/crontab/root
