#!/bin/bash
set -euo pipefail

# If RUN_ON_STARTUP is true, run backup script
# Otherwise, execute the command passed as arguments
if [ "${RUN_ON_STARTUP:-false}" = "true" ]; then
    exec /app/backup.sh
else
    # If no arguments provided, start a shell
    if [ $# -eq 0 ]; then
        exec /bin/bash
    else
        exec "$@"
    fi
fi
