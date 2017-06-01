#!/usr/bin/env bash

check-operation () {
    gcloud service-management operations describe "$1"
}

can () {
    gcloud "$@" 2>&1 | grep -q .
}

has () {
    can config list --format="value($*)"
}
