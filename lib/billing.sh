#!/usr/bin/env bash
# Use functions from this file: source bin/gcloud-utilities.sh

get_billing_account () {
    gcloud alpha billing accounts list --format='value(name)'
}

ensure_billing_for_project () {
    while ! get_billing_account | grep -q .
    do
        echo '*** Setup billing for your account at https://console.cloud.google.com/billing'
        echo '*** So we can actually use the services.'
        open https://console.cloud.google.com/billing
        read -sp "Hit enter once you have set up a billing account"
    done

    echo "*** Using billing account: $(get_billing_account)"

    gcloud alpha billing accounts projects link "$1" --account-id "$(get_billing_account)"
}
