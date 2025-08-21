Opened 2022-12-30

See also zim-wiki --▷ LINUX:1Linux Live USB:01installed apps:docker

# Help incl. glossary

## URLs

https://github.com/AkhilJx/Docker-Cheat-Sheets/tree/main -- some linked below

https://jsdev.space/docker-commands-cheatsheet/

https://docs.docker.com/get-started/docker_cheatsheet.pdf

https://phoenixnap.com/kb/wp-content/uploads/2022/12/docker-commands-cheat-sheet-pdf.pdf

https://github.com/AkhilJx/Docker-Cheat-Sheets/blob/main/4855175-docker-cheatsheet-r4v2.pdf

## Glossary

Dockerfile: 
The first step in using Docker is writing a Dockerfile. It is an essential blueprint for constructing Docker images. It is a text file, is usually named "Dockerfile" without any extension, and contains a series of instructions. Each line in this file represents a new instruction, forming a stack of layers. Each layer is cache-able. When you build an image twice, it will use the cache. When you change a line in the file, it rebuilds all instructions after and including the change.

Image: 
Building a Dockerfile outputs a Docker image. You can think of an image like an executable. Just like clicking an icon (executable) on your desktop to launch an application. You can start an image to launch a container. The Docker image encapsulates your application code and all its dependencies. This includes the runtime and system libraries. It is a self-contained unit that ensures consistency and portability across various environments. For example, your development machine and your production server.

Container: 
This is a dynamic, running instance of a Docker image. An executed image spawns a container with the command in the Dockerfile. Important to note: one image can give life to many containers. If Linux is your operating system, the Docker container will run as a process on the host machine. If you have a Windows or macOS machine, docker will run in a virtual machine (VM). The container will use the same kernel, either the kernel of Linux or the VM on Windows or macOS. The container itself is not a virtual machine. The container cannot see other processes of the host and has its own file system. This is why it seems as it is a virtual machine. But in reality, it shares the kernel of the host machine (or the kernel of the VM).

In conclusion: the Dockerfile is the base for an image, and an image is used to create a container. A container is running as a process on the host machine. Yet, it has its own file system and is separated from the other processes.


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


## Run Dockerfile

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
