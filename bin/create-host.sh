#!/usr/bin/env bash

NAME=${1:-docker-host}
shift
STARTUP=${*:-sudo wget -qO- https://get.docker.com/ | sh}

source "$(dirname "$BASH_SOURCE")/../lib/utilities.sh"

has compute.region || gcloud config set compute/region europe-west1
has compute.zone   || gcloud config set compute/zone europe-west1-c

can compute instances list --filter name="$NAME" ||
gcloud compute instances create "$NAME" \
 --machine-type n1-standard-1 \
 --image-family=ubuntu-1404-lts --image-project=ubuntu-os-cloud \
 --metadata startup-script="$STARTUP"

echo "** Trying to access $NAME soon as it becomes available -- might take a while"

while ! gcloud compute ssh "$NAME" -- uname -a
do
    echo -n .
    sleep 1
done
