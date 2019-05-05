#!/bin/bash
# Major revision.
# Description: This will synchronise all ravencoin IPFS objects with your IPFS node.
# This script expects to run as 'ipfs' user, but modifications have been made where it should run as any user.

#Sync all Ravencoin objects up to April 2019 for IPFS node;
# deprecating
#wget -c https://bootstrap.ravenland.org/ipfs.tar; tar -xvf ipfs.tar;cd ipfs; for i in $(ls); do ipfs add "$i"; done;


finish() {
killall sync_all_not_related_ipfs_hashes.sh
}
trap finish EXIT

cat banner;
sleep 3

echo "Ravencoin IPFS Swarm + IPFS Mirror Service"; sleep 1;
echo "created by push@ravenland.org (C) 2019"; sleep 1;



curl -L http://bootstrap.ravenland.org/ravencoin_chain_only_$(date +%Y-%m-%d).txt > allipfs
mkdir sync;
cd sync;
while read -r hash; do


#validate hash isnt present already before downloading
is_valid=$(ipfs pin ls --type=recursive | grep $hash);
echo "checking if $hash already present.."
if [ -z "$is_valid" ]
then
# could use just curl -L and pipe to | ipfs add stdin
wget -c -t 1 -T 60 "https://gateway.ravenland.org/ipfs/$hash"
ipfs add "$hash"
else
echo "We have this file already pinned. Skipping..."
#deletes file  on disk if already pinned, runs each start so eventually will empty
# could be its own service ('clean ipfs sync dir when pinned found $is_valid')
rm "$hash"
fi

done < ../allipfs
