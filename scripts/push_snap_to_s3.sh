#!/bin/bash

set -e

stage=$1

s3_loc="s3://omnivector-public-assets/snaps/prometheus-node-exporter/$stage/"
echo "Copying snap to $s3_loc"
aws s3 cp --acl public-read *.snap $s3_loc
