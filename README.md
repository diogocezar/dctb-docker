# Docker Hacks

Material baseado em: https://www.youtube.com/watch?v=hCMcQfGb4cA

# Instalação

```
$ wget -qO- https://get.docker.com/ | sh
$ sudo usermod -aG docker <usuario>
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

