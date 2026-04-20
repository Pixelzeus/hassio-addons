#!/usr/bin/env bashio

bashio::log.info "Starting..."

# #region agent log
debug_log() {
    local hypothesis_id="$1"
    local message="$2"
    local data_json="$3"
    local ts
    ts="$(date +%s%3N 2>/dev/null || date +%s000)"
    printf '{"sessionId":"f231bf","runId":"pre-fix","hypothesisId":"%s","location":"run.sh","message":"%s","data":%s,"timestamp":%s}\n' \
        "$hypothesis_id" "$message" "$data_json" "$ts" >> "debug-f231bf.log"
}
# #endregion

# Warn users about ignored Forge settings when server type is not Forge.
if [ -n "${FORGE_VERSION:-}" ] && [ "${TYPE:-}" != "FORGE" ]; then
    bashio::log.warning "FORGE_VERSION is set but TYPE is '${TYPE:-unset}'. FORGE_VERSION is only used when TYPE=FORGE."
fi

# #region agent log
debug_log "H1" "entrypoint_env" "{\"type\":\"${TYPE:-unset}\",\"version\":\"${VERSION:-unset}\",\"forgeVersion\":\"${FORGE_VERSION:-unset}\",\"memory\":\"${MEMORY:-unset}\"}"
debug_log "H2" "java_version" "{\"javaVersion\":\"$(java -version 2>&1 | tr '\n' ' ' | sed 's/\"//g' | sed 's/[[:space:]]\\+/ /g')\"}"
debug_log "H3" "start_script_presence" "{\"startExists\":$( [ -x /start ] && echo true || echo false ),\"forgeRunScriptExists\":$( [ -f /data/run.sh ] && echo true || echo false )}"
# #endregion

/start
start_exit_code=$?

# #region agent log
debug_log "H4" "start_finished" "{\"exitCode\":${start_exit_code}}"
# #endregion

exit "${start_exit_code}"
