# prometheus-node-exporter-snap
This repository contains the components needed to build the prometheus-node-exporter as a snap.

Find out more about the prometheus-node-exporter [here](https://github.com/prometheus/node_exporter).


### Build
To install this snap you first need to build it. From the root of this repository, run:
```bash
snapcraft --use-lxd
```

### Installation
Once the snap has built, you can install it with:
```bash
sudo snap install prometheus-node-exporter_`cat VERSION`_amd64.snap --classic --dangerous
```
* `--dangerous` - because we are installing a locally built snap, who's sha can't be verified through the snapstore.
* `--classic` - classic confinement is used to allow the snap to access system level resources.

### Configuration
To configure prometheus-node-exporter create the file `/var/snap/prometheus-node-exporter/common/node-exporter.conf`.
The file should resemble the following, setting the desired `node_exporter` configs in a string that is assigned to `ARGS`.
```bash
# Node Exporter Config File
# This file should reside at /var/snap/prometheus-node-exporter/common/node-exporter.conf

ARGS="--web.listen-address=0.0.0.0:9000 --collector.ntp.protocol-version=4"
```

After creating or updating the config file you must restart the prometheus-node-exporter service.
```bash
sudo service snap.prometheus-node-exporter.prometheus-node-exporter restart
```

#### Copyright
* Omnivector Solutions (c) 2020

#### License
* MIT - see `LICENSE` file in this directory.
