FROM docker.io/caddy:2.10.2-builder-alpine@sha256:afedc89367579c34450cdd8434cb6cd695904c78252c2ee0e3c002c33a044ea8 AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.10.2-alpine@sha256:f2b257f20955d6be2229bed86bad24193eeb8c4dc962a4031a6eb42344ffa457

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
