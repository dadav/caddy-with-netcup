FROM docker.io/caddy:2.8.4-builder-alpine@sha256:edc6e5121f18919c8f0acb4c578a271ce1806d1a5f0bfd15180b17eedcccd793 AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.8.4-alpine@sha256:fea55ae5ce2e5c07dd3d592cc34862504075d55d505d731cdc2a3f051d70d39c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
