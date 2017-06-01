#!/bin/bash

set -e

SDK_URL=https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-156.0.0-darwin-x86_64.tar.gz

cd $(dirname "$BASH_SOURCE")

curl "$SDK_URL" | tar xzf -
./google-cloud-sdk/install.sh --quiet --command-completion=false --path-update=false

source activate
