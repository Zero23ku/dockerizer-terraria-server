# Dockerized tShock
tShock is a dedicated server Software for Terraria.

You can learn more about it [here](https://tshock.readme.io/docs)

This image is based on Linux Alpine 3.9.6 using [tShock v4.3.26](https://github.com/Pryaxis/TShock/releases) for Terraria 1.3.5.3


# How to run

If you wanna try it, use the following command:
```
docker run -p 7777:7777 zero23ku/tshock-terraria:1.0
```
I do not recommend running the server like that in the long run because the moment the container stop running the world will be lost.
If you wanna run the server and be able to configure, add plugins and keep the world even if the container dies, you will need to run it like this

```
docker run -p 7777:7777 -v path/to/host/config:/tshock/tshock -v path/to/host/worlds:/opt/Terraria/world -v path/to/host/plugins:/tshock/ServerPlugins zero23ku/tshock-terraria:1.0
```

With that you will be able to configure your server and keep the files in your host machine.

Also [here](https://github.com/Zero23ku/dockerizer-terraria-server/blob/master/docker-compose.yml) is an example of a docker-compose file to achieve the same result as the command showed above

# Aditional parameters

The following enviroment variables can be set through docker run command or setting them in a docker-compose file:

* WORLD (default value: default.wld) The name of the world the server will use, if the file do not exist, tShock will create a new world with this name **You need to add the extension .wld when you set the value**

* MAXPLAYERS (default value: 16) The amount of maximun players in the server

* PORT (default value: 7777) The port the server will use **This have nothing to do with the port the host machine use to expose the container, this is the internal port the container will use**

* AUTOCREATE (default value: 3) The size of the world to be created if there is no world when running the server **possible values: 1 (small) , 2 (medium) , 3 (big)**

# Additional notes

tShock also have an Api Rest admins can use to do a number of things, it comes turn off by default, but you can activate it modifying the config.json file in the config folder. More info [here](https://tshock.readme.io/reference)

If will need to expose the Api Rest port too, by default is the port 7878 but you also can modify it in the config.json file
