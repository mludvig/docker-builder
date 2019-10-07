FROM docker:latest

RUN apk add --update jq bash build-base linux-headers git openssh
RUN apk add --update python3 python3-dev py3-pip \
  py3-cryptography py3-urllib3 \
  py3-markupsafe py3-docutils
RUN pip3 install prospector
RUN pip3 install boto3 botocore
RUN pip3 install awscli ansible

COPY ecr-login.sh /usr/local/bin/ecr-login.sh
