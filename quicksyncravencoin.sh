#!/bin/bash
# Author: push
# website: www.ravenland.org
# description: A fast sync service for Ravencoin
# although not designed to replace the traditional reindex, it is much faster and may provide useful
# we are working on a port for Linux, alongside our Windows ravencoin pinner port currently worked on by LSJI07 and push.
# Compatibility: presently for RavencoinOS v2 only.
     
     echo "This is a fast sync tool full index service provided by Ravenland for Ravencoin Linux Wallets."
     echo "presently only RavencoinOSv2 is supported but it can be altered to support any Linux OS"
     sleep 5
     echo "Backing up wallet and configuration.."
     sleep 3
     echo "Always backup your wallet.dat file in /home/ravencoin/.raven/wallet.dat to another computer just in case."
     sleep 2
     echo "Generating Unix timestamp for wallet"
     unixtimestamp=$(date +%s)
      sleep 2
        sudo -i -u ravencoin mkdir -p /home/ravencoin/backups
        sudo -i -u ravencoin cp /home/ravencoin/.raven/wallet.dat "/home/ravencoin/backups/$unixtimestamp-wallet.dat"
	sudo -i -u ravencoin cp /home/ravencoin/.raven/raven.conf /home/ravencoin/backups/raven.conf

	echo "stopping Ravend Service.."
	sudo systemctl stop ravend
	echo "Making sure Ravencoin service enabled for next reboot.."
	sudo systemctl enable ravend
	echo "Removing assets chaindata.."
	sleep 2
	sudo rm -rf /home/ravencoin/.raven/assets
	echo "Removing blocks chaindata.."
	sleep 2
	sudo rm -rf /home/ravencoin/.raven/blocks
	echo "Removing state chaindata.."
	sleep 2
	sudo rm -rf /home/ravencoin/.raven/chainstate
	echo "Removing databases.."
	sleep 2
	sudo rm -rf /home/ravencoin/.raven/database

  echo "Downloading Fullchain from source.. (this will not replace your wallet.dat)"
  sudo -i -u ravencoin wget -c https://bootstrap.ravenland.org/ravencoinOS-bootstrap.tar -P /home/ravencoin -O ravencoinOS-bootstrap.tar


	echo "Extracting the Fullchain from source"
	sleep 2
	sudo -i -u ravencoin tar xvf ravencoinOS-bootstrap.tar
	echo "Removing the temporary tar file"
	sleep 2
	sudo -i -u ravencoin rm ravencoinOS-bootstrap.tar
	echo "Adding permissions for RavencoinOS ravendstatuslog"
	sleep 2
       	sudo chown -R :pi /home/ravencoin/.raven/debug.log
	sudo -i -u ravencoin cp /home/ravencoin/backups/raven.conf /home/ravencoin/.raven/raven.conf 
	sudo -i -u ravencoin chown -R ravencoin:ravencoin /home/ravencoin/.raven/raven.conf
	sudo mkdir -p /root/.raven
	sudo cp /home/ravencoin/.raven/raven.conf /root/.raven/raven.conf
	sudo mkdir -p /home/pi/.raven
	sudo cp /home/ravencoin/.raven/raven.conf /home/pi/.raven/raven.conf
	sudo chown -R pi:pi /home/pi/.raven/raven.conf
	sudo systemctl start ravend --no-pager
