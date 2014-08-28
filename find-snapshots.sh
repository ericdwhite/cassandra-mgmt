#!/bin/bash
#
# 1. Find old snapshots (e.g. not the latest)
#    $ ./find-snapshots.sh
#
# 2. Find ALL snapshots including the latest
#    $ ./find-snapshots.sh -Y
#
# 3. Find ONLY the LATEST snapshot
#    $ ./find-snapshots.sh -Y -O
#

INCLUDE_LATEST=$1
ONLY_LATEST=$2
for keyspace in `find data -type d -mindepth 2 -maxdepth 2`; do
  for latestsnapshot in `find $keyspace -type d -mindepth 2 -maxdepth 2 | sort -nr | head -1`; do
    if [ "$ONLY_LATEST" == "-O" ]; then
      echo $latestsnapshot
      continue
    fi
    for oldersnapshot in `find $keyspace -type d -mindepth 2 -maxdepth 2 | sort -nr`; do
      if [ "$INCLUDE_LATEST" == "-Y" ]; then
        echo $oldersnapshot
      else
        if [ "$oldersnapshot" != "$latestsnapshot" ]; then
          echo $oldersnapshot
        fi
      fi
    done
  done
done

