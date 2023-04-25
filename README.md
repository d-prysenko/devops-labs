## [Лабараторная работа №1: установка Docker](https://gitlab.com/antonholmes/devops/-/blob/main/%2B2.%20Git.%20Docker/!Lab%201.%20Install.md)

### Система:
**Manjaro (Arch-based linux)**

![](/assets/neofetch.png)

*Установлена дуалбутом с win 10.*
### Установка docker:
В этом дистрибутиве Docker уже был предустановлен, поэтому установим его в чистом образе Arch linux:
> **>** `docker pull archlinux`<br>
> **>** `docker run --privileged -it archlinux:latest`<br>

[В документации докера](https://docs.docker.com/desktop/install/archlinux/) написано: *Docker does not have an Arch package repository. Binaries not included in the package must be installed manually before installing Docker Desktop.* 

Поэтому устанавливаем вручную:
> **[root@f9a1202e31eb /]#** `pacman -Syu --noconfirm wget git`<br>
> **[root@f9a1202e31eb /]#** `mkdir temp && cd temp`<br>
> **[root@f9a1202e31eb /temp]#** `wget https://download.docker.com/linux/static/stable/x86_64/docker-23.0.4.tgz`<br>
> ...<br>
> 2023-04-25 14:47:32 (4.97 MB/s) - ‘docker-23.0.4.tgz’ saved [66970065/66970065]<br>
> **[root@f9a1202e31eb /temp]#** `tar xzvf docker-23.0.4.tgz`<br>
> **[root@f9a1202e31eb /temp]#** `cp docker/* /usr/bin/`<br>

Проверим, что демон запускается и в целом все работет:
> **[root@f9a1202e31eb /temp]#** `dockerd &`<br>
> **[root@f9a1202e31eb /temp]#** `docker run hello-world`<br>
> ...<br>
> Hello from Docker!
> This message shows that your installation appears to be working correctly.
> 
> To generate this message, Docker took the following steps:
>  1. The Docker client contacted the Docker daemon.
>  2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
>     (amd64)
>  3. The Docker daemon created a new container from that image which runs the
>     executable that produces the output you are currently reading.
>  4. The Docker daemon streamed that output to the Docker client, which sent it
>     to your terminal.
> 
> To try something more ambitious, you can run an Ubuntu container with:
>  $ docker run -it ubuntu bash
> 
> Share images, automate workflows, and more with a free Docker ID:
>  https://hub.docker.com/
> 
> For more examples and ideas, visit:
>  https://docs.docker.com/get-started/

Однако **docker есть в community репозитории**, в котором находится акутальная версия, поэтому это всё можно заменить одной строкой, дополнительно сразу установив docker-compose:<br>
> **[root@f9a1202e31eb /]#** `pacman -Syu docker docker-compose`

Включаем сервис с помощью `systemctl start docker && systemctl enable docker`.

[Bash скрипт](/docker_install.sh) для установки докера на manjaro находится в корневой директории этого репозитория.