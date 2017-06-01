#!/usr/bin/env bash

NAME=${1:-docker-host}
shift
STARTUP=${*:-sudo wget -qO- https://get.docker.com/ | sh}

source "$(dirname "$BASH_SOURCE")/../lib/utilities.sh"

has compute.region || gcloud config set compute/region europe-west1
has compute.zone   || gcloud config set compute/zone europe-west1-c

can compute instances describe "$NAME" ||
gcloud compute instances create "$NAME" \
 --machine-type n1-standard-1 \
 --image ubuntu-14-04 \
 --metadata startup-script="$STARTUP"

gcloud compute ssh "$NAME" -- uname -a
