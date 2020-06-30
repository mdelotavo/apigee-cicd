FROM alpine:3.10
LABEL maintainer="Matthew Delotavo <matthew@darumatic.com>"
RUN apk add --no-cache --update \
      python3 python3-dev gcc \
      gfortran musl-dev g++ \
      libffi-dev openssl-dev \
      libxml2 libxml2-dev \
      libxslt libxslt-dev \
      libjpeg-turbo-dev zlib-dev \
      npm \
      git \
      make \
      coreutils \
      gnupg gawk \
      bash \
 && pip3 install --no-cache --upgrade \
      pip setuptools wheel apigeecli==0.14.1 \
 && npm install -g \
      apigeelint newman \
 && git clone https://github.com/AGWA/git-crypt.git \
 && cd git-crypt \
 && make \
 && make install PREFIX=/usr/local \
 && cd .. \
 && git clone https://github.com/sobolevn/git-secret.git git-secret \
 && cd git-secret && make build \
 && make \
 && make install PREFIX=/usr/local
WORKDIR /home/apigee
