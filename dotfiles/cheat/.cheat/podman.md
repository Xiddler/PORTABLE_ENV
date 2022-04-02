Opened 2022-04-02

# to copy a file from local directory into a containered directory
podman cp /myapp/app.conf containerID:/myapp/app.conf
# example
podman cp /home/donagh/.zsh_aliases 0b40f94c7fd4:/home/donagh/.zsh_aliases 
podman cp /home/donagh/files/simple.md 0b40f94c7fd4:/home/donagh/simple.md 
# failed because '-i' WTF?

