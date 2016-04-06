# Minecraft Docker Container
All you need to build a docker container based on [alpine linux](http://www.alpinelinux.org/) and [spigot](https://www.spigotmc.org/)  to provide a
mincraft server.

## First Run
For the first successfull execution make a directory for the configuration and
create a file to agree to Mojangs [EULA](https://account.mojang.com/documents/minecraft_eula).

    mkdir config
    echo eula=true > config/eula.txt
    docker run -v $PWD/config:/minecraft/config -p 25565:25565 d4v1d31/minecraft

The configuration directory also stores the minecraft maps.
