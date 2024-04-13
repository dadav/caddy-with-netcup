FROM docker.io/caddy:2.7.6-builder-alpine AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.7.6-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
