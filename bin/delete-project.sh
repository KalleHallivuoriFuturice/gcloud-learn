#!/bin/bash

set -e

DEFAULT_PROJECT=$(gcloud config list --format='value(core.project)')
PROJECT="${1:-$DEFAULT_PROJECT}"

gcloud projects delete -q "$PROJECT"

[ "$PROJECT" = "$DEFAULT_PROJECT" ] && gcloud config unset project

gcloud projects list
