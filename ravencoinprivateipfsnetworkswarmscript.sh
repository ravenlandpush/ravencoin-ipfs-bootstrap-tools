#!/bin/bash
# Author: push
# Website: www.ravenland.org
# A simple tool used to join the Ravenland Ravencoin IPFS Private Swarm
# Run as the ipfs user
#RAVENCOIN IPFS PRIVATE SWARM SETUP

# copy this key to your /home/username/.ipfs
wget https://bootstrap.ravenland.org/swarm.key 

# copy the secure key to the user you run ipfs' ipfs dir run ipfs init if this is a new install
# UNCOMMENT this line if first time running IPFS
# ipfs init

cp swarm.key ~/.ipfs

# stop ipfs if it is running
killall ipfs

# start ipfs
ipfs daemon &

# remove public bootstraps 
ipfs bootstrap rm all

# Add ravenland IPFS swarm to bootsrap
ipfs bootstrap add /ip4/91.134.145.4/tcp/5555/ipfs/QmWWA3RAuD9gN3fQBJFed9TZVC4J4BuQfcgfdqGgNNpw1x
#secondary swarm node 2
ipfs bootstrap add /ip4/3.8.238.93/tcp/4001/ipfs/QmUZsTG8yMM8CnfQZhfGmaYRFTP37VwWnBuTuYbjhxSVAX
#tertiary swarm node 3
ipfs bootstrap add /ip4/35.176.228.149/tcp/4001/ipfs/QmZXnxQVHwLQsMar4m9PXY96Lez7Ht6Lz4VmioAVs3UDAG
#4th backup swarm node
ipfs bootstrap add /ip4/18.130.93.116/tcp/4001/ipfs/QmYmhNET8d6Y4UV5PeMhvd5kCj12mR2ha71cZTicdE6wZF

# connect to the Ravenland IPFS Private Ravencoin Swarm nodes
ipfs swarm connect /ip4/91.134.145.4/tcp/5555/ipfs/QmWWA3RAuD9gN3fQBJFed9TZVC4J4BuQfcgfdqGgNNpw1x
# secondary swarm node 2
ipfs swarm connect /ip4/3.8.238.93/tcp/4001/ipfs/QmUZsTG8yMM8CnfQZhfGmaYRFTP37VwWnBuTuYbjhxSVAX
# tertiary node 3
ipfs swarm connect /ip4/35.176.228.149/tcp/4001/ipfs/QmZXnxQVHwLQsMar4m9PXY96Lez7Ht6Lz4VmioAVs3UDAG
# 4th backup swarm node
ipfs swarm connect /ip4/18.130.93.116/tcp/4001/ipfs/QmYmhNET8d6Y4UV5PeMhvd5kCj12mR2ha71cZTicdE6wZF
