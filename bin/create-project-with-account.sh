#!/bin/bash
# gcloud auth login

set -e
PROJECT=${1:-learn-$USER-$(date '+%Y%m%d-%H%M')}
SERVICE_ACCOUNT=${2:-learning-client}
USER_ACCOUNT=${3:-$(gcloud config list --format='value(core.account)')}
SERVICE_ACCOUNT_EMAIL="$SERVICE_ACCOUNT@$PROJECT.iam.gserviceaccount.com"

gcloud projects create "$PROJECT" --set-as-default --account="$USER_ACCOUNT"

gcloud iam service-accounts create "$SERVICE_ACCOUNT" --project="$PROJECT"

gcloud projects add-iam-policy-binding "$PROJECT" \
	--member="serviceAccount:$SERVICE_ACCOUNT_EMAIL" \
	--role=roles/viewer

gcloud projects get-iam-policy "$PROJECT"
