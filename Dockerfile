FROM docker.io/caddy:2.11.9-builder-alpine@sha256:d26fbc8a56ed8c3c1534f5573162d148ad3ed41732665da8526eb181fac0b728 AS builder

# renovate: datasource=go depName=github.com/caddy-dns/netcup
ARG NETCUP_VERSION=v1.0.0

RUN xcaddy build \
  --with github.com/caddy-dns/netcup@${NETCUP_VERSION}

# Invariant: the CI workflow derives image tags from the X.Y.Z in this FROM line.
FROM docker.io/caddy:2.11.9-alpine@sha256:0bbb055bda6793c999bde78b1b5ce3e89f829fb031af2cf50056ea1246559fee

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
