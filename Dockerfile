FROM docker.io/caddy:2.11.9-builder-alpine@sha256:646fee578e680989ca5c7fd1ce6f1de574d19fd71ef2221810cc0510a9f40c86 AS builder

# renovate: datasource=go depName=github.com/caddy-dns/netcup
ARG NETCUP_VERSION=v1.0.0

RUN xcaddy build \
  --with github.com/caddy-dns/netcup@${NETCUP_VERSION}

# Invariant: the CI workflow derives image tags from the X.Y.Z in this FROM line.
FROM docker.io/caddy:2.11.9-alpine@sha256:003a97808e781aa9f7e75cc2f43d34d461099031faf5e20faefb9f61126836f0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
