Opened 2022-12-30


# Notes
A Docker container is an isolated environment that runs an image. 

# Example run debian
-> % docker run --rm -it debian:11

# Run debian and use a (volume) directory on the host
docker run --rm -it -v $(pwd):/some/where debian:11
eg
docker run --rm -it -v $(pwd):/home/donagh/TESTING/python debian:11
then
$ apt update
$ apt upgrade

# make new user (not root)


# Start docker daemon
sudo systemctl enable docker.service
sudo systemctl start docker.service

# start a container with an interactive shell
docker run -ti <image_name> /bin/bash

# "shell" into a running container (docker-1.3+)
docker exec -ti <container_name> bash

# inspect a running container
docker inspect <container_name> (or <container_id>)

# Get the process ID for a container
# Source: https://github.com/jpetazzo/nsenter
docker inspect --format {{.State.Pid}} <container_name_or_ID>

# List the current mounted volumes for a container (and pretty print)
# Source:
# http://nathanleclaire.com/blog/2014/07/12/10-docker-tips-and-tricks-that-will-make-you-sing-a-whale-song-of-joy/
docker inspect --format='{{json .Volumes}}' <container_id> | python -mjson.tool

# Copy files/folders between a container and your host
docker cp foo.txt mycontainer:/foo.txt

# list currently running containers
docker ps

# list all containers
docker ps -a

# list all images
docker images
