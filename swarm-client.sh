#!/bin/bash
# Author: push at ravenland.org
# Date: 26/04/2019
# Description: A Basic Client Service that can be daemonised with SystemD on Linux Systems to provide an infrastructural integrity
# service for all Ravencoin IPFS objects existing on the Ravencoin chain. Begone lost interplanetary files on the Ravencoin IPFS network.
# data loss on IPFS Ravencoin begone!

# to be added to cron.daily
# Mirror all IPFS on Ravencoin chain from source at Seed master.

spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

finish() {
killall swarm-client.sh
}
trap finish EXIT

cat banner;
sleep 3

echo "Ravencoin IPFS Swarm + IPFS Mirror Service"; sleep 1;
echo "created by push@ravenland.org (C) 2019"; sleep 1;

echo "Connecting to master Swarm Server via IPFS"; sleep 1;
# client command to connect to Ravenland Ravencoin swarm service
ipfs swarm connect /ip4/91.134.145.4/tcp/4001/ipfs/QmdgR69oTuHDoUjRrhYSiz5cpkXCj371vmF6qx3uxPkSSJ

echo "adding Ravenland Ravencoin IPFS Mirror Service to your IPFS Bootstrap configuration"; sleep 1;
# client command to permanently bootstrap your client to Ravenland Ravencoin Swarm Service
ipfs bootstrap add /ip4/91.134.145.4/tcp/4001/ipfs/QmdgR69oTuHDoUjRrhYSiz5cpkXCj371vmF6qx3uxPkSSJ


curl -L bootstrap.ravenland.org/ravencoin_ipfs_list_$(date +%Y-%m-%d).txt > allipfs

# Create working Sync directory
mkdir sync

cd sync;
while read -r hash; do

printf 'Synchronising Ravencoin IPFS_Hash Object $hash: '
spinner &



        wget -c "https://gateway.ravenland.org/ipfs/$hash";
        kill "$!" 2> /dev/null;
        wait "$!" 2> /dev/null;

        printf "\nAdding Object as IPFS Pin..   "
        spinner &
        ipfs pin add $hash;

kill "$!" 2> /dev/null
wait "$!" 2> /dev/null  # kill the spinner
printf '\n';

done < "../allipfs"


#while read -r hash2; do
#       ipfs pin add $hash2
#done < "../allipfs"


# client command to connect to Ravenland Ravencoin swarm service
ipfs swarm connect /ip4/91.134.145.4/tcp/4001/ipfs/QmdgR69oTuHDoUjRrhYSiz5cpkXCj371vmF6qx3uxPkSSJ

# client command to permanently bootstrap your client to Ravenland Ravencoin Swarm Service
ipfs bootstrap add /ip4/91.134.145.4/tcp/4001/ipfs/QmdgR69oTuHDoUjRrhYSiz5cpkXCj371vmF6qx3uxPkSSJ

# connection may not be persistent
# Some additional steps may be necessary. Whilst this work in progress.
