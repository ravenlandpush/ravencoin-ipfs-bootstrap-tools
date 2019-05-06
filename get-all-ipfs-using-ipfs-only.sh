#!/bin/sh
# Simple script to get a filesystem copy using the ipfs daemon DHT network of all objects
# Previous revisions didnt include directory detection properly thru the gateway and could end up with strange index.html
# and redirections
# This natively downloads from IPFS and therefore ensures that the ipfs data is copied correctly
# folders will need to be added with find . -type d | xargs -i ipfs add -r {}
# files can be added as normal with find . -type f | xargs -i ipfs add {}
#plans to build in some checking from ipfs output that the input hash matched the filename hash
# (this prevents incomplete ipfs hash files (which will have a different ipfs hash) being added to the ipfs daemon).

# for now this simple script does nearly everything.
# will be adding this to ravencoinOS soon

cd ipfs
cat ../allipfs | awk {'print $2'} | xargs -n1 -I{} /usr/local/bin/ipfs get {}
