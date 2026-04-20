# HAMC Server (Java)

This add-on allows for hosting a Minecraft Java server using Home Assistant. Based on the Minecraft server docker by [itzg](https://github.com/itzg/docker-minecraft-server).

## Configuration

All configuration is done using the add-on options. It allows for setting the environment variables found [here](https://github.com/itzg/docker-minecraft-server).

### Forge loader version

When `TYPE` is set to `FORGE`, you can use `FORGE_VERSION` to control the Forge loader version:

- `FORGE_VERSION: ""` (empty) uses the recommended Forge version for the selected Minecraft `VERSION`
- `FORGE_VERSION: "latest"` uses the latest available Forge version
- `FORGE_VERSION: "<version>"` uses a specific Forge version (example: `47.2.0`)

### Mods and plugins (Forge, Fabric, …)

Put mod or plugin `.jar` files in the `mods` folder **inside the add-on configuration directory** (Home Assistant: **Add-on** → **Open folder** / `addon_config` for this add-on). That path is `/data` in the container, so use `…/mods/` next to your world and `server.properties`.

Do **not** rely on the generic `hassio_data` share for mods unless you copy files into the configuration `mods` folder above — the running server only loads mods from `/data/mods`.

To access the Minecraft server from outside your network, forward port 25565 (TCP) on your router. Then connect using:

```
<your_ip>:25565
```

## References

* Thanks to [alexbelgium](https://github.com/alexbelgium/hassio-addons) for the add-on template.
* Thanks to [itzg](https://github.com/itzg/docker-minecraft-server) for the docker image.