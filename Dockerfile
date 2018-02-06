FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add nodejs-lts nodejs-npm openssh-client git php5-cli mysql-client postgresql-client mc php5-pgsql php5-curl bash php5-phar php5-json php5-openssl php5-dom php5-ctype php5-xmlreader php5-mysqli php5-zip
RUN ln -sf /bin/bash /bin/sh
RUN ln -sf php5 /usr/bin/php
RUN apk update --repository http://dl-3.alpinelinux.org/alpine/v3.5/community/
RUN apk add php5-xdebug --repository http://dl-3.alpinelinux.org/alpine/v3.5/community/
RUN echo "zend_extension=xdebug.so" > /etc/php5/conf.d/xdebug.ini
RUN mv /etc/php5/conf.d/xdebug.ini /etc/php5/conf.d/xdebug.ini-off
RUN echo -e "\nerror_reporting = E_ALL & ~E_NOTICE | E_STRICT" >> /etc/php5/conf.d/99-error-reporting.ini
RUN mkdir -p /root/.config/mc
RUN echo -e "[Midnight-Commander]\neditor_fake_half_tabs=0\n[Layout]\nmessage_visible=0\ncommand_prompt=0" > /root/.config/mc/ini
RUN git config --system user.email "docker-php-unit-tests@example.com"
