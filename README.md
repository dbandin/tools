# Dockerized tools tools-image
The files in [tools-image](tools-image) allow to create a docker image with tools for development.

## Usage

* Once this repository is checked out, switch into the directory [tools-image](tools-image).


* Build
```sh
make dk-build
```

* Run this command also gets into the interactive session.
```sh
make dk-run
```

## Pushing the image to a container registry.
If you want to upload the image to your docker registry, you need to be logged in into your docker registry and edit the Makefile changing the **DOCKER_ID_USER** variable setting.
Then to publish, once you edited the makefile and you are logged in to your desired container registry, just run the following command.

```
make dk-publish
```

## Notes
Exiting the interactive mode won't terminate the running container in your host, you'll be able to list the stopped containers with **docker ps -a**. Then you can start them again, attach or just delete them with **rm**.

# tmux-sessions

There are some scripts here to help me manage tmux sessions.