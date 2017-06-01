#!/bin/bash

set -e

SDK_URL=$(
    curl -s https://cloud.google.com/sdk/downloads |
        perl -wne 'print /"([^"]*'$(uname -s)-$(uname -m)'\.tar\.gz)"/i'
)

cd $(dirname "$BASH_SOURCE")

curl "$SDK_URL" | tar xzf -
./google-cloud-sdk/install.sh --quiet --command-completion=false --path-update=false \
    --additional-components compute alpha

source activate
source lib/billing.sh

echo '*** Create a test account or login with an existing one in your browser'

gcloud auth login

ensure_billing_for_project $(gcloud config list --format='value(core.project)')

cat doc/after-setup.md
