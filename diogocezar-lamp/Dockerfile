FROM ubuntu:14.04

MAINTAINER Diogo Cezar <diogo@diogocezar.com>

######################
# UPDATE AND UPGRADE #
######################

RUN apt-get clean all
RUN apt-get update && apt-get -y upgrade

###########
# INSTALL #
###########

# APACHE #
RUN apt-get install -y \
    apache2

# GIT #
RUN apt-get install -y git

# SSH #
RUN apt-get install -y openssh-server

# NANO #
RUN apt-get install -y nano

# UNZIP #
RUN apt-get install -y unzip

# BASH-COMPLETION #
RUN apt-get install -y bash-completion

# CURL #
RUN apt-get install -y curl

# COMMON #
RUN apt-get -y install software-properties-common

# PHP 5 #
RUN add-apt-repository ppa:ondrej/php5-5.6 -y && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && apt-get update
RUN apt-get install -y --allow-unauthenticated \
    php5 \
    php-gettext \
    php5-curl \
    php5-gd \
    php5-dev \
    php5-xmlrpc \
    php5-intl \
    php5-mcrypt \
    php5-mysql \
    php5-cli \
    libapache2-mod-php5 \
    && apt-get clean

# COMPOSER #
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer

##################
# CONFIGURATIONS #
##################

RUN rm -Rf /var/www/html
RUN mkdir -p /var/lock/apache2 /var/run/apache2

RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY php.ini /etc/php5/apache2/php.ini

RUN a2ensite 000-default.conf && a2enmod rewrite && a2enmod php5

env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2

########
# PORT #
########
EXPOSE 80

##########
# VOLUME #
##########
VOLUME ["/var/www"]

########
# EXEC #
########
CMD ["apache2", "-D", "FOREGROUND"]