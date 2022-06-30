Opened 2022-04-02

see zim-wiki/Computer/LINUX:1Linux Live USB:01installed apps:podman


# to check status of containers
-> % sudo podman ps -a

# to start an existing container that is running
❯ podman exec -it mycontainer /bin/zsh


# to start up a container (assuming alpine was the latest)
❯ sudo podman run -it alpine:latest


# to copy a file from local directory into a containered directory
podman cp /myapp/app.conf containerID:/myapp/app.conf
# example
podman cp /home/donagh/.zsh_aliases 0b40f94c7fd4:/home/donagh/.zsh_aliases 
podman cp /home/donagh/files/simple.md 0b40f94c7fd4:/home/donagh/simple.md 
# failed because '-i' WTF?
