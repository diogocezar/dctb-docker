# Estudos do Docker

# Instalação

## Docker

```
$ wget -qO- https://get.docker.com/ | sh
$ sudo usermod -aG docker <usuario>
```

## Docker Compose

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

# Construindo uma imagem

```
docker build -t=diogocezar/lamp .
docker build -t=diogocezar/php7 .
docker build -t=diogocezar/nodejs .
```

# Subindo uma imagem

```
docker run -itd -p 8888:80 -v ~/dctb-docker/diogocezar-lamp/www:/var/www diogocezar/lamp
```

```
docker run -itd -p 8888:80 -v ~/dctb-docker/diogocezar-lamp/www:/var/www -v /var/lib/mysql:/var/lib/mysql diogocezar/lamp
```

```
docker run -itd -p 8888:80 -v ~/dctb-docker/diogocezar-lamp/www:/var/www -v /var/lib/mysql:/var/lib/mysql --link db diogocezar/lamp
```

```
docker run -itd -p 8888:8888 -v ~/dctb-docker-nodejs/www:/var/www diogocezar/nodejs
```

# Limpando Containers e Imagens

```
#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
```

# Matando Containers e Excluindo-os

```
docker kill $(docker ps -q) && docker rm $(docker ps -a -q)
```

# Entrando no Bash

```
sudo docker exec -i -t dctb-lamp /bin/bash
```

# Executando Docker Compose

```
docker-compose up -d
```

# Links Úteis

* https://www.youtube.com/watch?v=hCMcQfGb4cA

* https://docs.docker.com/compose/install/

* https://docs.docker.com/compose/completion/docker

* http://www.mundodocker.com.br/docker-compose/

* https://hub.docker.com/r/silintl/php-web/~/dockerfile/

* https://hub.docker.com/r/kaushalkishore/docker-lamp/~/dockerfile/

* https://www.vivaolinux.com.br/artigo/Criando-imagens-Docker-com-Dockerfile

* https://medium.com/dev-tricks/apache-and-php-on-docker-44faef716150#.6pncvx7ip

* https://docs.docker.com/engine/examples/running_ssh_service/

* https://gist.github.com/thom-nic/724a2af410e90a654e35