Opened 2022-12-30

See also LINUX:1Linux Live USB:01installed apps:docker

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

# Dockerfile

- Docker builds images by reading the instructions from a Dockerfile. A Dockerfile is a text file containing instructions for building your source code.

https://docs.docker.com/build/concepts/dockerfile/

## Sample Dockerfile

> This Dockerfile:

- Starts from an Ubuntu image
- Installs Python
- Copies source code
- Runs the python app

> Each declaration adds a layer that makes up the final image. We can then build images from Dockerfiles and launch containers from those images.
### {{{ Dockerfile

```
# Base image
FROM ubuntu

# Install dependencies
RUN apt-get update && apt-get install -y python3

# Copy source code
COPY . /app/src

# Launch app
CMD ["python", "/app/src/app.py"]
```

### }}}


# Run Dockerfile

Ensure docker daemon is running
> ->% sudo systemctl status docker
> ->% sudo systemctl enable docker
> ->% sudo systemctl start docker

The following creates a new docker image
> ->% docker build - < Dockerfile

List docker images
> ->% docker image ls
You will see something like this:

REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
<none>                     <none>              123456789        39 seconds ago      422MB

Copy your actual IMAGE ID and then run

> ->% docker run 123456789

If you do not want to remember the image id, you can tag your image by

> ->% docker tag 123456789 pavel/pavel-build





# ==================================================================================================================
# END



