# Ravencoin IPFS Mirror + Swarm Tools
Ravencoin Bootstrap Tools for IPFS Object Mirroring and Swarm are simple. This is a Ravenland public beta (see https://www.ravenland.org  and https://www.ravencoinos.org for more).

![preview](https://cdn.discordapp.com/attachments/509938075816689681/571752300918603796/unknown.png)
**Example screenshot + custom layout for RavencoinOS Swarm Client, IPFS Mirror and Raven Full node**

# Swarm is now live!
The master Ravenland server is now ready for your peers to report to. Understand that adding yourself to the master swarm, protects the Ravencoin network, and replicates the important IPFS backed meta data which is empowering the linked Ravencoin network.

swarm hostname: swarm.ravenland.org
dedicated swarm IP: 91.134.145.4


# Instructions
Simply obtain the client shellscript and run it as the user which IPFS is configured. (the user which has ~/.ipfs initialized).

```
git clone https://github.com/ravenlandpush/ravencoin-ipfs-bootstrap-tools
cd ravencoin-ipfs-bootstrap-tools
chmod +x swarm-client.sh
./swarm-client.sh
```

# Manually Connect to swarm (without script): 
```
ipfs swarm connect /ip4/91.134.145.4/tcp/4001/ipfs/QmdgR69oTuHDoUjRrhYSiz5cpkXCj371vmF6qx3uxPkSSJ
ipfs bootstrap add /ip4/91.134.145.4/tcp/4001/ipfs/QmdgR69oTuHDoUjRrhYSiz5cpkXCj371vmF6qx3uxPkSSJ
```

# Example & Screenshot using script 'swarm-client.sh'

![preview](https://gateway.ravenland.org/ipfs/Qmcu1rFhAKj4dBbyCq7utUA5t3rCame5PD3cpsSfvyGpxA)


![Ravenland](https://ravenland.org/img/ravenland_text_logo.c117b9bb.png)
A project supported by https://www.ravenland.org


