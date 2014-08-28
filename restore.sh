#!/bin/bash

echo Stoping Cassandra
launchctl unload /usr/local/opt/cassandra/homebrew.mxcl.cassandra.plist

echo Removing current data *** DESTRUCTIVE *** 
(cd data
  find . -type f ! -path "*/snapshots/*" -exec rm {} \;
)
rm -f commitlog/*

echo Restoring snapshot data
(cd data
for keyspace in `find . -type d -mindepth 2 -maxdepth 2`; do
  echo Restoring: $keyspace
  for snapshot in `find $keyspace -type d -mindepth 2 -maxdepth 2 | sort -nr | head -1`; do
    echo Copying contents from: $snapshot to: $keyspace
    find $snapshot -type f -exec cp -p {} $keyspace \;
  done
done
)

echo Starting Cassandra
launchctl load /usr/local/opt/cassandra/homebrew.mxcl.cassandra.plist
launchctl start homebrew.mxcl.cassandra
nodetool -h localhost -p 7199 repair


