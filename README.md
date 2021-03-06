# prometheus-node-exporter-snap
This repository contains the components needed to build the prometheus-node-exporter as a snap.

Find out more about the prometheus-node-exporter [here](https://github.com/prometheus/node_exporter).


### Build
Lxd and snapcraft are required to build this snap, if you don't already have them installed, run the following commands:

```bash
sudo snap install lxd && sudo lxd init --auto
```
```bash
sudo snap install snapcraft --classic`
```

Once you have the build requirements installed, from the root of this repository:

```bash
snapcraft --use-lxd
```

### Installation
After the snap finishes building, you can install it with:
```bash
sudo snap install prometheus-node-exporter_`cat VERSION`_amd64.snap --classic --dangerous
```
* `--dangerous` - because we are installing a locally built snap, who's sha can't be verified through the snapstore.
* `--classic` - classic confinement is used to allow the snap to access system level resources.

### Configuration
To configure prometheus-node-exporter create the file:

```bash
/var/snap/prometheus-node-exporter/common/node-exporter.conf
```

The file should resemble the following, setting the desired `node_exporter` configs in a string that is assigned to `ARGS`:

```bash
# Node Exporter Config File
# This file should reside at /var/snap/prometheus-node-exporter/common/node-exporter.conf

ARGS="--web.listen-address=0.0.0.0:9000 --collector.ntp.protocol-version=4"
```

After creating or updating the config file you must restart the prometheus-node-exporter service:

```bash
sudo service snap.prometheus-node-exporter.prometheus-node-exporter restart
```

#### Copyright
* Omnivector Solutions (c) 2020
* www.omnivector.solutions
* info@omnivector.solutions
* community.omnivector.solutions

#### License
* MIT - see `LICENSE` file in this directory.
