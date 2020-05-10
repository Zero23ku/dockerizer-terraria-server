#!/bin/sh
eval unzip -n tshock.zip && rm tshock.zip
eval mono TerrariaServer.exe -port ${PORT} -worldpath /opt/Terraria/world -world /opt/Terraria/world/${WORLD} -maxplayers ${MAXPLAYERS} -autocreate ${AUTOCREATE}