# ARG CADDY_VERSION=2.6.4
ARG CADDY_VERSION=latest
FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

# FROM caddy:${CADDY_VERSION}-alpine
FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]