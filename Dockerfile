FROM docker

MAINTAINER Michael Ludvig

RUN apk add --update jq bash build-base
RUN apk add --update python3 python3-dev py3-pip \
  py3-yaml py3-cryptography py3-urllib3 \
  py3-markupsafe py3-docutils
RUN pip3 install awscli ansible

COPY Dockerfile /

ENTRYPOINT [ "/bin/bash", "-l" ]
