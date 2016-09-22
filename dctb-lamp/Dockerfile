FROM ubuntu:16.04
MAINTAINER Diogo Cezar <diogo@diogocezar.com>
# UPDATE AND UPGRADE
RUN apt-get clean all
RUN apt-get update && apt-get -y upgrade
# INSTALL APACHE
RUN apt-get install -y \
    apache2
# INSTALL GIT
RUN apt-get install -y git
# INSTALL CURL
RUN apt-get install -y curl
# INSTALL PHP 5.6
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y --allow-unauthenticated \
    php7.0 \
    php5.6 \
    php-gettext \
    php5.6-mbstring \
    php-xdebug \
    php5.6-curl \
    php5.6-gd \
    php5.6-xml \
    php5.6-zip \
    php5.6-intl \
    php5.6-mcrypt \
    php5.6-mysql \
    libapache2-mod-php5.6 \
    && apt-get clean
# ENABLE APACHE MODS
RUN a2enmod php5.6
RUN a2enmod rewrite
# CHANGE TO PHP 5.6
RUN a2dismod php7.0 && a2enmod php5.6 && service apache2 restart
RUN ln -sfn /usr/bin/php5.6 /etc/alternatives/php
# INSTALL COMPOSER
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer
# RESTART APACHE
RUN service apache2 restart
# PORT CONFIGURE
EXPOSE 8080
# VOLUME
VOLUME ["/var/www/html"]
CMD ["apache2ctl", "-D", "FOREGROUND"]