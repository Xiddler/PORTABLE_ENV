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


