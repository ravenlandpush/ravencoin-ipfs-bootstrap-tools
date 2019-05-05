#!/bin/bash
# simply syncs all natively using ipfs pin add

#Sync all Ravencoin objects up to April 2019 for IPFS node;
# deprecating
#wget -c https://bootstrap.ravenland.org/ipfs.tar; tar -xvf ipfs.tar;cd ipfs; for i in $(ls); do ipfs add "$i"; done;


finish() {
killall simple-sync-all.sh
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
echo "adding $hash to IPFS Mirror store"
ipfs pin add "$hash" &
else
echo "We have this file already pinned. Skipping..."
fi

done < ../allipfs
