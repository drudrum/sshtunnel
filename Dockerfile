FROM alpine:3.2
MAINTAINER NOSPAM <nospam@nnn.nnn>

ENV SSH_USER=${SSH_USER:-user}
ENV SSH_PORT=${SSH_PORT:-22}
ENV REMOTE_HOST=${REMOTE_HOST:-localhost}

COPY init.sh /init.sh

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*; \
    chmod +x /init.sh

CMD /init.sh
EXPOSE 1-65535
