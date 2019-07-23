#!/bin/bash -xe

if [ "$1" == "help" -o "$1" == "--help" ]; then
    echo "(optional) set \$ECR_LOGIN to 'yes' or to login to default account"
    echo "           or to a comma separated list of account ids"
    exit 0
fi

/usr/local/bin/ecr-login.sh ${ECR_LOGIN}

exec "$@"
