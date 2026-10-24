FROM alpine:latest AS build

ARG ZOLA_VERSION=0.22.1

RUN apk add --no-cache wget ca-certificates && \
    wget -qO- "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
    | tar xzf - -C /usr/local/bin

WORKDIR /app
COPY . .
RUN zola build

FROM nginxinc/nginx-unprivileged:alpine

# Base image runs as non-root; switch back temporarily to pull in OS security fixes
USER root
RUN apk upgrade --no-cache

COPY --from=build /app/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

USER nginx

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --spider -q http://127.0.0.1:8080/ || exit 1
