# Docker Hacks

Material baseado em: 

https://www.youtube.com/watch?v=hCMcQfGb4cA

https://docs.docker.com/compose/install/

https://docs.docker.com/compose/completion/docker

http://www.mundodocker.com.br/docker-compose/

https://hub.docker.com/r/silintl/php-web/~/dockerfile/

https://www.vivaolinux.com.br/artigo/Criando-imagens-Docker-com-Dockerfile

# Instalação

```
$ wget -qO- https://get.docker.com/ | sh
$ sudo usermod -aG docker <usuario>
```

## Instalação docker compose

```
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

# Subir um container

```
$ docker run --name container-teste-1 ubuntu:16.04
```

# Hello World

```
$ docker run --name container-teste-2 ubuntu:16.04 /bin/echo 'Hello Word'
```

# Container Iterativo

```
$ docker run -ti --name container-teste-3 ubuntu:16.04 /bin/bash
```

# Container Demonizado

```
$ docker run -d --name container-teste-4 ubuntu 16.04 /bin/bash -c "while true; do echo hello world; sleep 1; done"
```

# Rascunho Dockerfile

```
FROM ubuntu:16.04
MAINTAINER Diogo Cezar <diogo@diogocezar.com>
# UPDATE AND UPGRADE
RUN
  apt-get update && \
  apt-get -y upgrade
# INSTALL APACHE
RUN
  apt-get install -y \
  apache2 \
  && sudo a2enmod rewrite
# INSTALL GIT
RUN
  apt-get install -y \
  git
# INSTALL CURL
RUN
  apt-get install -y \
  curl
# INSTALL PHP 5.6
RUN
  apt-get install -y \
  php5.6 \
  php5.6-curl \
  php5.6-intl \
  php5.6-mcrypt \
  php5.6-mysql \
  libapache2-mod-php5.6 \
  && php5enmod mcrypt \
  && apt-get clean
# INSTALL COMPOSER
RUN
  curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer \
  && chmod a+x /usr/local/bin/composer \
# INSTALL PHPMYADMIN
RUN
  apt-get install -y \
  phpmyadmin \
# PORT CONFIGURE
EXPOSE 8080
# VOLUME
VOLUME ["/var/www/html"]
CMD ["apache2ctl", "-D", "FOREGROUND"]
```
