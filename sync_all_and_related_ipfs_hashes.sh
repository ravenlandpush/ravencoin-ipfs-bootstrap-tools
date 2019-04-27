#!/bin/bash
# author: push at ravenland.org
# date: 26/04/2019
# description: simple script to download all Ravencoin IPFS hashes, and any related ones (ipfs hashes contained within streams of existing ipfs hash data).
# This is done natively via the IPFS network and does not use https://gateway.ravenland.org/ipfs/ to download the files via cloudflare
# cache. It may or may not be slower.

# Use this script if you want the Ravencoin objects on IPFS but don't want to join the Ravenland Ravencoin swarm
# A little bit less lightweight than desired.

# only works for dirs
#curl -L http://bootstrap.ravenland.org/ravencoin_ipfs_list_$(date +%Y-%m-%d).txt | xargs -i ipfs pin add -r {}


/home/ipfs/publish-ipfs-hashes-to-www.sh


finish() {
killall swarm-client-lightweight.sh
}
trap finish EXIT
cd /home/ipfs/ravencoin-ipfs-bootstrap-tools
cat banner;
sleep 3

echo "Ravencoin IPFS Swarm + IPFS Mirror Service"; sleep 1;
echo "created by push@ravenland.org (C) 2019"; sleep 1;



curl -L http://bootstrap.ravenland.org/ravencoin_chain_only_$(date +%Y-%m-%d).txt > allipfs
mkdir sync;
cd sync;
while read -r hash; do


#validate hash isnt present already before downloading
is_valid=$(ipfs pin ls | grep $hash);
echo "checking if $hash already present.."
if [ -z "$is_valid" ]
then
# could use just curl -L and pipe to | ipfs add stdin
wget -c https://gateway.ravenland.org/ipfs/$hash
ipfs add $hash
else
echo "We have this file already pinned. Skipping..."
#deletes file  on disk if already pinned, runs each start so eventually will empty
# could be its own service ('clean ipfs sync dir when pinned found $is_valid')
rm "/home/ipfs/sync/$hash"
fi

done < ../allipfs

