
# Maintain separate configuration for session in this project directory

CLOUDSDK_PREVIOUS_CONFIG_NAME="$CLOUDSDK_ACTIVE_CONFIG_NAME"
export CLOUDSDK_ACTIVE_CONFIG_NAME=$(
        pwd | sed 's:^'$HOME'::; s/[^A-Za-z0-9]/-/g; s/^--*//'
    )

gcloud config configurations create --no-activate "$CLOUDSDK_ACTIVE_CONFIG_NAME"

