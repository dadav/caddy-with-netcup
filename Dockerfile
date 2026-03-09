FROM docker.io/caddy:2.10.2-builder-alpine@sha256:afedc89367579c34450cdd8434cb6cd695904c78252c2ee0e3c002c33a044ea8 AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.10.2-alpine@sha256:4c6e91c6ed0e2fa03efd5b44747b625fec79bc9cd06ac5235a779726618e530d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
