#!/bin/bash
# A script that walks multiple gateways for an existing IPFS filesystem set of the IPFS_hash files
# 0 byte files or missing files are resumed, 
# using a loop like 
# screen -S ipfshash-hunter while true; do ./fixmissingipfs.sh; done
# allows you to run the script indefinitely. Better support coming this just a prototype. Will add support for more IPFS sources soon

cd ipfs

echo "Fix missing IPFS Hunter for Ravencoin by push@ravenland.org"; sleep 2;
echo "Hunting for Lost or missing IPFS Hashes..."; sleep 1
ls -altr | grep "root          0"

# this kinda hacky our asset explorer is a bit more elegant but not as efficient at resuming missing files
ls -altr  | awk '{print $9}' | xargs -i wget -c -T 5 -t 2 https://gateway.ravenland.org/ipfs/{}
ls -altr  | awk '{print $9}' | xargs -i wget -c -T 5 -t 2 https://cloudflare-ipfs.com/ipfs/{}
ls -altr  | awk '{print $9}' | xargs -i wget -c -T 5 -t 2 https://ipfs.infura.io/ipfs/{}
ls -altr  | awk '{print $9}' | xargs -i wget -c -T 5 -t 2 https://ipfs.io/ipfs/{}
