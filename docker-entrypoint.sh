#!/bin/bash -xe

if [ "$1" == "help" -o "$1" == "--help" ]; then
    echo "(optional) set $ECR_LOGIN to 'yes' or to login to default account"
    echo "           or to a comma separated list of account ids"
    exit 0
fi

if [ -n "${ECR_LOGIN}" ]; then
    test "${ECR_LOGIN}" == "yes" && ECR_LOGIN=""    # Login to the default account
    $(aws ecr get-login --no-include-email ${ECR_LOGIN:+--registry-ids $(sed 's/,/ /g' <<< ${ECR_LOGIN})})
    unset ECR_LOGIN
fi

exec "$@"