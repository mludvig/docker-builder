FROM docker

MAINTAINER Michael Ludvig

RUN apk add --update jq bash build-base
RUN apk add --update python3 python3-dev py3-pip \
  py3-cryptography py3-urllib3 \
  py3-markupsafe py3-docutils
RUN pip3 install awscli ansible

COPY Dockerfile docker-entrypoint.sh /
COPY ecr-login.sh /usr/local/bin/ecr-login.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "/bin/bash", "-l" ]
