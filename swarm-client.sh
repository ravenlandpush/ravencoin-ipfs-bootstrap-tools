#!/bin/bash
# Author: push at ravenland.org
# Date: 26/04/2019
# Description: A Basic Client Service that can be daemonised with SystemD on Linux Systems to provide an infrastructural integrity
# service for all Ravencoin IPFS objects existing on the Ravencoin chain. Begone lost interplanetary files on the Ravencoin IPFS network.
# data loss on IPFS Ravencoin begone!

# to be added to cron.daily
# Mirror all IPFS on Ravencoin chain from source at Seed master.

curl -L bootstrap.ravenland.org/ravencoin_ipfs_list_$(date +%Y-%m-%d).txt > allipfs

# Create working Sync directory
mkdir sync

cd sync;
while read -r hash; do
        wget "https://gateway.ravenland.org/ipfs/$hash";
        ipfs pin add $hash;
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
