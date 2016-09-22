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

RUN mkdir -p /var/lock/apache2 /var/run/apache2
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2ensite 000-default.conf && a2enmod rewrite
RUN a2enmod php5
RUN service apache2 restart

########
# PORT #
########
EXPOSE 80

##########
# VOLUME #
##########
VOLUME ["/var/www/html"]

########
# EXEC #
########
CMD ["apache2ctl", "-D", "FOREGROUND"]
