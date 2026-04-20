## next

- Fix mods (and plugins) appearing ignored: set `COPY_MODS_SRC=/data/mods` and `COPY_PLUGINS_SRC=/data/plugins` so the itzg image does not sync empty `/mods`/`/plugins` over jars stored under the Home Assistant configuration mount.

## 1.5.0

- Pin the Docker base image to `itzg/minecraft-server:java21` so Forge (e.g. 1.20.1) no longer runs on `latest` (Java 25), which caused `Unsupported class file major version 69` at startup.

- Exposed the RCON port (25575) for remote console access. Ensure to set a strong `RCON_PASSWORD` in the configuration to use this feature.
- Mount the data folder to `/addon_config` for easier access to configuration & world files by @meritw
- Fix the Gamemode option not working by renaming it to Mode

## 1.1.1

- Add ability to select server type by @joelhaasnoot

## 1.1.0

- Fixed HAOS option loading

## 1.0.0

- Initial release
