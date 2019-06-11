FROM golang:alpine
MAINTAINER "Oliver Shaw <ollie@jasper.io>"

ENV TERRAFORM_VERSION=0.11.13

RUN apk add --update git bash openssh nodejs nodejs-npm

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

WORKDIR $GOPATH
ENTRYPOINT ["terraform"]
