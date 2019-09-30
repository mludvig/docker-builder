#!/bin/bash -xe

# Optionally give comma-separated registry IDs as an argument.
# Without an argument logs into the default ECR registry.

if [ -n "$1" ]; then
    export ECR_LOGIN=$1
else
    ECR_LOGIN=""    # Login to the default AWS account
fi
$(aws ecr get-login --no-include-email ${ECR_LOGIN:+--registry-ids $(sed 's/,/ /g' <<< ${ECR_LOGIN})})
