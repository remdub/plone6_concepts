#!/bin/bash
set -e

COMMANDS="adduser debug fg foreground help kill logreopen logtail reopen_transcript run show status stop wait"
START="console start restart"

# Initializing from environment variables
# python3 /docker-initialize.py

# ZEO Server
if [[ "$1" == "zeo"* ]]; then
  exec bin/$1 fg
fi

# Plone instance start
if [[ $START == *"$1"* ]]; then
  exec bin/instance console
fi

# Plone instance helpers
if [[ $COMMANDS == *"$1"* ]]; then
  exec bin/instance "$@"
fi

# Custom
exec "$@"