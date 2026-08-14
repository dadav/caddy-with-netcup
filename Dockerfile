FROM docker.io/caddy:2.11.4-builder-alpine@sha256:2b9994510fadb5dfa5257a5357cbe26a2c4a3298f8cc675796a6570218280ce7 AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.11.4-alpine@sha256:c2af7d9004854180322ffd6f81b918874cee01f629084ab4d8ac0b96aa442432

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
