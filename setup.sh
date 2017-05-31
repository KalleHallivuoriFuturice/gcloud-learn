#!/bin/bash

set -e

SDK_URL=https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-156.0.0-darwin-x86_64.tar.gz

cd $(dirname "$BASH_SOURCE")

rm -rf activate google-cloud-sdk
touch activate

curl "$SDK_URL" | tar xzf -
./google-cloud-sdk/install.sh --quiet --rc-path=$PWD/activate
rm -f activate.backup

cat source/activate-template.sh >> activate
