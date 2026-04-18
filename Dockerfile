FROM docker.io/caddy:2.11.2-builder-alpine@sha256:113249e07ac54f02da3e395a7150124562af1a3129b0b1498ddbb39f5b3fc430 AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.11.2-alpine@sha256:fce4f15aad23222c0ac78a1220adf63bae7b94355d5ea28eee53910624acedfa

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
