FROM docker.io/caddy:2.10.2-builder-alpine@sha256:5fd6c969b828a4ccfd18767fd0420507d1c36f1d0a8c217805268a4825b78fb7 AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.10.2-alpine@sha256:f2b257f20955d6be2229bed86bad24193eeb8c4dc962a4031a6eb42344ffa457

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
