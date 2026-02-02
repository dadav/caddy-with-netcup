FROM docker.io/caddy:2.10.2-builder-alpine@sha256:d315d063ae1b9f8d5768f9d6fa98d8f77365f49b4f2c28f8ddc991b29b0c2a8a AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/netcup

FROM docker.io/caddy:2.10.2-alpine@sha256:7f4c19ed8c32f961644681823de1a2fe5b74c84a45d0f3995286010c84b6c554

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
