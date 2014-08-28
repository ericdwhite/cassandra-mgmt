#!/bin/bash

echo Taking a snapshot of all key spaces
nodetool -h localhost -p 7199 snapshot

