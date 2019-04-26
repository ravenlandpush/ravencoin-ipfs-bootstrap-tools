#!/bin/bash
# author: push at ravenland.org
# date: 26/04/2019
# description: simple script to download all Ravencoin IPFS hashes, and any related ones (ipfs hashes contained within streams of existing ipfs hash data).
# This is done natively via the IPFS network and does not use https://gateway.ravenland.org/ipfs/ to download the files via cloudflare
# cache. It may or may not be slower.

# Use this script if you want the Ravencoin objects on IPFS but don't want to join the Ravenland Ravencoin swarm

curl -L https://bootstrap.ravenland.org/ravencoin_ipfs_list_25_04_2019.txt | xargs -i ipfs pin add -r {}
