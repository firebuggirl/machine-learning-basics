# Useful Docker Commands


## Docker Machine

- `docker-machine start` - Start VM
- `docker-machine stop` - Stop VM
- `docker-machine env` - Display Docker client setup commands

## Docker Client

- `docker <command> --help` - Get help on a specific command
- `docker pull <Name of Image>` - Pull image from Docker Hub
- `docker images` - Show all images
- `docker rmi <ImageID>` - Remove specific images
- `docker rmi $(docker images | grep "^<none>" | awk "{print $3}")` - Remove untagged images - <none>
- `docker ps -a` - Show all containers
- `docker rm <ContainerID>` -Remove specific container
- `docker rm $(docker ps -a -q)` Remove all containers
- `docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'` - Formatted list of containers
- `docker run -d --name <Container Name> -p <External Port>:<Container Port> <Your Image>` - Run a container
- `docker build -f <Your Dockerfile> -t <Tag Name> .` - Build an image from a Dockerfile
- `docker login` - Login using your Docker credentials
- `docker push <Your Image Name>` - Push an image to Docker hub

## Docker Compose

- `docker-compose build` - Build images based on docker-compose
- `docker-compose up -d` - Start in daemon mode
- `docker-compose logs` - Show logs from containers
- `docker-compose up` - Start containers based on docker-compose
- `docker-compose stop` - Stop containers
- `docker-compose down` - Stop and remove containers





## Return dangling images:

    - ..often occurs when building a new image and tagging it w/ an existing tag

    ` docker image ls --filter dangling=true `


## Delete all dangling images:


    ` docker image prune `

    ` docker images prune -a `//also remove all unused images..ie., those not being used by any containers


## Other filters:

    `dangling`

    `before` -> requires and image name or ID as an argument & returns all images created before it

    `since` -> same as above, but returns images created after the specified image

    `label` -> filter images by label &/or label/value


## Delete unused volumes

    ` docker volume prune `

## Delete volume(s) along with containers

    ` docker-compose down -v
    `
# Container Lifetime & Persistent Data: Volumes, Volumes, Volumes

## Persistent Data: Data Volumes

  `  docker pull mysql

    docker image inspect mysql

    docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True mysql

    docker container ls

    docker container inspect mysql

    docker volume ls

    docker volume inspect TAB COMPLETION

    docker container run -d --name2 mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True mysql

    docker volume ls

    docker container stop mysql

    docker container stop mysql2

    docker container ls

    docker container ls -a

    docker volume ls

    docker container rm mysql mysql2

    docker volume ls

    docker container run -d --name mysql -e `

## Name a volume `mysql-db`

    ` MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql `

  `  docker volume ls

    docker volume inspect mysql-db

    docker container rm -f mysql

    docker container run -d --name mysql3 -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql

    docker volume ls

    docker container inspect mysql3

    docker volume create --help

    ## Persistent Data: Bind Mounting

    cd dockerfile-sample-2

    pcat Dockerfile

    docker container run -d --name nginx -p 80:80 -v $(pwd):/usr/share/nginx/html nginx

    docker container run -d --name nginx2 -p 8080:80 nginx

    docker container exec -it nginx bash

    ## Assignment Answers: Edit Code Running In Containers With Bind Mounts

    docker run -p 80:4000 -v $(pwd):/site bretfisher/jekyll-serve `

##  Look at running processes inside container

    ` docker container top <image-name>
    `
