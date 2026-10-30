FROM docker.io/caddy:2.11.7-builder-alpine@sha256:d718a1d1431403c4a46698f33ad1c0f9dd5dd7fe2bae654d1027d275b6fb5fd7 AS builder

# renovate: datasource=go depName=github.com/caddy-dns/netcup
ARG NETCUP_VERSION=v1.0.0

RUN xcaddy build \
  --with github.com/caddy-dns/netcup@${NETCUP_VERSION}

# Invariant: the CI workflow derives image tags from the X.Y.Z in this FROM line.
FROM docker.io/caddy:2.11.7-alpine@sha256:e70b164da81ef698b3ad19af799ea6086ce6d9e48ed4079eb9fe26f6fbf14ee5

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
