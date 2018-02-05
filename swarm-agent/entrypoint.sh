#!/bin/sh
set -xe

FLAGS="-labels $LABELS -executors $EXECUTORS -fsroot $FSROOT -name docker-$(hostname) -deleteExistingClients -disableClientsUniqueId"

if [[ -n $MASTER ]]; then
  FLAGS="$FLAGS -master $MASTER"
fi

if [[ -n $USERNAME ]]; then
  FLAGS="$FLAGS -username $USERNAME"
  if [[ -n $PASSWORD ]]; then
    FLAGS="$FLAGS -password $PASSWORD"
  fi
fi

java -jar "$FSROOT/swarm-client.jar" $FLAGS
