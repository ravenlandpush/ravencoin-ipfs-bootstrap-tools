#!/bin/bash
# Unlike sync all + related, this script only retrieves IPFS hashes that exist (or have existed) on the Ravencoin Asset blockchain
# whereas the sync all + related script is capable of retrieving 'related' objects (ipfs hash that exist inside of the output streams other files on the IPFS network).
# to be revised with better automation soon

#Sync all Ravencoin objects up to April 2019 for IPFS node;
# deprecating
#wget -c https://bootstrap.ravenland.org/ipfs.tar; tar -xvf ipfs.tar;cd ipfs; for i in $(ls); do ipfs add "$i"; done; 


finish() {
killall sync_all_not_related_ipfs_hashes.sh
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
rm "/home/ipfs/sync/$hash"
fi

done < ../allipfs


