#!/usr/bin/env bash
# Use functions from this file: source bin/gcloud-utilities.sh

get_billing_account () {
    gcloud alpha billing accounts list --format='value(name)'
}

ensure_billing_account () {
    while ! get_billing_account | grep -q .
    do
        echo '*** Setup billing for your account at https://console.cloud.google.com/billing'
        echo '*** So we can actually use the services.'
        read
    done

    echo "*** Using billing account: $(get_billing_account)"
}
