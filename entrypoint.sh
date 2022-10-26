#!/bin/sh

set -e

# Check if incoming command contains flags.
if [ "${1#-}" != "$1" ]; then
    set -- hello-native "$@"
fi

exec "$@"
