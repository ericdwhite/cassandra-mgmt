#!/bin/bash

REMOVE=$1
for oldsnapshot in `./find-snapshots.sh`; do
  if [ "$REMOVE" == "-Y" ]; then
    echo Removing: $oldsnapshot
    rm -fr $oldsnapshot
  else
    echo Found: $oldsnapshot
  fi
done

if [ "$REMOVE" != "-Y" ]; then
  echo "Not removing run $0 -Y to remove found items."
fi

