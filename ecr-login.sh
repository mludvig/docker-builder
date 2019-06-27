#!/bin/bash -xe

if [ -n "$1" ]; then
    export ECR_LOGIN=$1
    test "$1" == "yes" && ECR_LOGIN=""    # Login to the default AWS account
    $(aws ecr get-login --no-include-email ${ECR_LOGIN:+--registry-ids $(sed 's/,/ /g' <<< ${ECR_LOGIN})})
fi
