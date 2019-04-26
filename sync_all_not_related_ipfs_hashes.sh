#!/bin/bash
# Unlike sync all + related, this script only retrieves IPFS hashes that exist (or have existed) on the Ravencoin Asset blockchain
# whereas the sync all + related script is capable of retrieving 'related' objects (ipfs hash that exist inside of the output streams other files on the IPFS network).
# to be revised with better automation soon

#Sync all Ravencoin objects up to April 2019 for IPFS node;
wget -c https://bootstrap.ravenland.org/ipfs.tar; tar -xvf ipfs.tar;cd ipfs; for i in $(ls); do ipfs add "$i"; done; 

