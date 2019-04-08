# nginx

## Getting started

To build this docker image run the following

```
docker build -t nginx:latest .
```

Once build use the following to run this

```
docker run -p 80:80 -d nginx:latest 
```


## Other 
### To copy a file

docker cp <containerID>:/var/www/html/..

docker cp relaxed_thompson:/etc/nginx/..

### To create a network

docker network create mynetwork

docker build --build-arg CONTAINERNAME='Container99' -t nginx:CONTAINER_99 .
docker run --name=Container99 -p 8080:80 --network mynetwork  -d nginx:CONTAINER_99 

docker build --build-arg CONTAINERNAME='Container100' -t nginx:CONTAINER_100 .
docker run --name=Container100 -p 8090:80 --network mynetwork  -d nginx:CONTAINER_100 

docker build --build-arg CONTAINERNAME='reverseProxy' -t nginx:reverseProxy .
docker run -p 80:80 --network mynetwork  -d nginx:reverseProxy 

### Delete images and containers

```
docker rm $(docker ps -a -q) && docker rmi $(docker images -q)
```

### Debug issues

To see what's going on inside a running container you can use 

```
docker exec -i -t [containerid] /bin/bash
```