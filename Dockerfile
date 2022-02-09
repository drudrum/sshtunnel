FROM alpine:3.2
MAINTAINER NOSPAM <nospam@nnn.nnn>

ENV TUNNEL_USER=${TUNNEL_USER:-user}
ENV TUNNEL_PORT=${TUNNEL_PORT:-22}
ENV REMOTE_HOST=${REMOTE_HOST:-localhost}

COPY init.sh /init.sh

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*; \
    chmod +x /init.sh

CMD /init.sh
EXPOSE 1-65535
