Scripts
=======
All of these scripts are intended to be run from the `var/lib` directory of
cassandra.

    e.g. /usr/local/var/lib/cassandra

For additional info see: http://www.datastax.com/documentation/cassandra/2.0/cassandra/operations/ops_backup_restore_c.html

Create a new setup of snapshots
-------------------------------
This script will create new snapshots.  It expects to be run on the host running cassandra.  It also
expects that cassandra is running.

    $ ./backup.sh

Find old snapshots
------------------
This script is used to find old snapshots, including or excluding the latest
snapshot.  See the script for the options: -Y -O

      $ ./find-snapshots.sh

E.g. use this script to find all the snapshots to be rsync'ed to a backup location.

Remove old snapshots
--------------------
Permantely remove ALL snapshots, leaving only the LATEST.

    $ ./remove-old-snapshots.sh

Restore the LATEST snapshot
---------------------------
This script allows you to restore the latest snapshot.

    $ ./restore.sh

Other Notes
===========

OSX Stop Cassandra
------------------

    launchctl unload /usr/local/opt/cassandra/homebrew.mxcl.cassandra.plist

OSX Start Cassandra
------------------

    launchctl load /usr/local/opt/cassandra/homebrew.mxcl.cassandra.plist

