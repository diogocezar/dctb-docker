# Docker Hacks

# Links Úteis

https://www.youtube.com/watch?v=hCMcQfGb4cA

https://docs.docker.com/compose/install/

https://docs.docker.com/compose/completion/docker

http://www.mundodocker.com.br/docker-compose/

https://hub.docker.com/r/silintl/php-web/~/dockerfile/

https://hub.docker.com/r/kaushalkishore/docker-lamp/~/dockerfile/

https://www.vivaolinux.com.br/artigo/Criando-imagens-Docker-com-Dockerfile

https://medium.com/dev-tricks/apache-and-php-on-docker-44faef716150#.6pncvx7ip

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

# Construindo uma imagem

```
docker build -t=diogocezar/lamp .
```

# Subindo uma imagem

```
docker run -it -p 8080:8080 diogocezar/lamp /bin/bash
```
