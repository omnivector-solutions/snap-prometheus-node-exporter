# prometheus-node-exporter-snap
This repository contains the components needed to build the prometheus-node-exporter snap.


## Build
To install this snap you first need to build it. From the root of this repository, run:
```bash
snapcraft --use-lxd
```

## Installation
Once the snap has built, you can install it with:
```bash
sudo snap install prometheus-node-exporter_`cat VERSION`_amd64.snap --classic --dangerous
```
* `--dangerous` - because we are installing a locally built snap, who's sha can't be verified through the snapstore.
* `--classic` - classic confinement is used to allow the snap to access system level resources.


#### Copyright
* Omnivector Solutions (c) 2020

#### License
* MIT - see `LICENSE` file in this directory.
