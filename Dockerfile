FROM alpine
MAINTAINER zhengxiaoyao0716 <1499383852@qq.com>
# forked from https://github.com/vimagick/dockerfiles/tree/master/nodebb

ENV BB_VER 1.7.3
ENV BB_URL https://github.com/NodeBB/NodeBB/archive/v$BB_VER.tar.gz
ENV BB_SOURCE /usr/src/nodebb
ENV BB_CONTENT /var/lib/nodebb

WORKDIR $BB_SOURCE
VOLUME $BB_CONTENT

RUN set -ex \
    && apk add -U bash \
                  imagemagick \
                  krb5-libs \
                  nodejs \
                  nodejs-npm \
                  openssl \
    && apk add -t TMP build-base \
                      curl \
                      git \
                      krb5-dev \
                      openssl-dev \
                      python \
                      tar \
    && curl -sSL $BB_URL | tar xz --strip 1 \
    && npm install --production \
    && npm cache clean \
    && apk del TMP \
    && rm -rf /tmp/npm* \
              /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 4567
CMD ["npm", "start"]