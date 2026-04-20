#!/usr/bin/env bashio

bashio::log.info "Starting..."

# Warn users about ignored Forge settings when server type is not Forge.
if [ -n "${FORGE_VERSION:-}" ] && [ "${TYPE:-}" != "FORGE" ]; then
    bashio::log.warning "FORGE_VERSION is set but TYPE is '${TYPE:-unset}'. FORGE_VERSION is only used when TYPE=FORGE."
fi

/start
