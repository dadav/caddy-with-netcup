FROM docker.io/caddy:2.11.7-builder-alpine@sha256:95a5e7e2692b5eb9545aadc5b90a39f6f509bee59c9508a493f83ee902eaef63 AS builder

# renovate: datasource=go depName=github.com/caddy-dns/netcup
ARG NETCUP_VERSION=v1.0.0

RUN xcaddy build \
  --with github.com/caddy-dns/netcup@${NETCUP_VERSION}

# Invariant: the CI workflow derives image tags from the X.Y.Z in this FROM line.
FROM docker.io/caddy:2.11.7-alpine@sha256:d8542f48d34a9cf4e4c11a478865229840e87e4c96ea3f439101f31a5d35f75f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
