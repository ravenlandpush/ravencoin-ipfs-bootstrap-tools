#!/bin/bash
# Author: push at ravenland.org
# Date: 26/04/2019
# Description: Quick script to generate a recursive pin list at the Ravenland Ravencoin IPFS master head
# for use with daily crontab. (hourly OK too).
# There are better capbiltes coming to ipfs cluster, but they are not yet available. This seems best way to achieve
# Ravencoin IPFS Master Mirror and swarm peer network.

ipfs pin ls --type=recursive | awk '{print $1}' > /path/to/server/public_html/ravencoin_ipfs_list_$(date +%Y-%m-%d).txt


# This won't make much sense to some, but this comes from our asset explorer backend and is how ravencoin_chain_only lists are generated
# versus the list above which is generated on our Ravencoin Swarm Master Node and mirror service machine

# ls -al /home/ipfs/ipfs-from-chain/ipfs | awk '{print $9'} > /path/to/www/public_html/ravencoin_chain_only_$(date +%Y-%m-%d).txt
#chown -R nginx:nginx /path/to/www/public_html/
