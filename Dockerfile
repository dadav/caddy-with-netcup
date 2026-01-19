FROM docker.io/caddy:2.10.2-builder-alpine@sha256:c020d8711e3b8b567e1f87bd8489719f2fa3aa1bf7c3433294a1fda5722f64ec AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.10.2-alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
