# papermc-docker

A hassle free docker image that allows running a PaperMc Minecraft server in no time. For Linux.

## Usage

To use the latest stable version of Minecraft and latest build of PaperMc, run
```
sudo docker run -p 25565:25565 -v /root/papermc_server:/papermc_server -e EULA=true layoutxml/papermc-docker
```
Feel free to change the ``/root/papermc_server`` folder to folder of your choice.

## Options

### Arguments

The following arguments can be passed at build time as build arguments (``--build-arg EULA=true``) or at the run time as environment variables (``-e EULA=true``). They will be saved and remembered for each subsequent run, unless conflicting argument is passed.

Name|Default value|Note
-|-|-
**EULA**|**false**|**You must agree to Minecraft's EULA**
JDK_VERSION|14-slim|This is the latest currently allowed OpenJDK version. Feel free to change it in the future. This argument can only be used as a build argument.
FOLDER_NAME|papermc_server|Useful to change when running multiple servers.
PROJECT_NAME|paper|PaperMc project name. ``paper / waterfall / travertine``.
MINECRAFT_VERSION||If no version specified, will use the latest stable version.
PAPERMC_VERSION|latest|If no version specified, will use the latest PaperMc build.
RAM|1024M|Server RAM. `M` for MB, `G` for GB.
JAVA_ARGS||Additional java args.

### Useful Docker Arguments

Name|Argument|Note
-|-|-
**Port**|**``-p 25565:25565``**|**You must use this argument to map default 25565 port (on the right) to any open port (on the left). Without it, the port will remain closed.**
**Volume**|**``-v /root/papermc_server:/papermc_server``**|**You must use this argument to map default ``papermc_server`` folder to a folder on your machine. Without it, the data will be lost when container stops.**
Detached|``-d``|Run docker container in a detached way, allowing use of console for other tasks.
Interactive|``-ti``|Allows interacting with server via commands when container not detached (or reattached via `docker attach` command).
Restart policy|``--restart <type>``|Docker container restart policy. Types: ``no / on-failure / unless-stopped / always``.

## Other Information

[Docker Hub page](https://hub.docker.com/r/layoutxml/papermc-docker)

[GitHub page](https://github.com/LayoutXML/papermc-docker)

### Author

More information about me and my projects: https://rokas.dev

### License

papermc-docker is licensed under "MIT" license. Copyright laws apply.

Copyright © 2020 Rokas Jankūnas (LayoutXML)
