#!/bin/bash

set -e

umask $UMASK

chown -R ${PUID}:${PGID} /app
chown -R ${PUID}:${PGID} /rec

export HOME=/home/user

exec /usr/local/bin/gosu ${PUID}:${PGID} dotnet /app/BililiveRecorder.Cli.dll $@