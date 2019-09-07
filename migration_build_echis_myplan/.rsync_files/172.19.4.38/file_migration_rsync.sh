#!/bin/bash
rsync -e 'ssh -oStrictHostKeyChecking=no' --append-verify -aH --info=progress2 \
    \
    ansible@172.19.3.41:/opt/data/couchdb2/ /opt/data/couchdb2/ \
     \
    --files-from /tmp/file_migration/172.19.3.41_4a7327fd__files \
    -r $@ &

    pids[0]=$!


# wait for all pids
for pid in ${pids[*]}; do
    wait $pid
done