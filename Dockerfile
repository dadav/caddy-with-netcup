FROM docker.io/caddy:2.8.4-builder-alpine AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.8.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
