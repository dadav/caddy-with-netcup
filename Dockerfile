FROM docker.io/caddy:2.8.4-builder-alpine@sha256:4ac56838081008c467ae701ebf425c53db62f91e5fa723151904b9ee75d09346 AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.8.4-alpine@sha256:fea55ae5ce2e5c07dd3d592cc34862504075d55d505d731cdc2a3f051d70d39c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
