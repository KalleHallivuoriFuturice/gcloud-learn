#!/usr/bin/env bash

check-operation () {
    gcloud service-management operations describe "$1"
}

can () {
    gcloud "$@" 2>/dev/null | grep -q .
}

has () {
    can config list --format="value($*)"
}
