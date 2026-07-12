FROM alpine:latest AS build

ARG ZOLA_VERSION=0.22.1

RUN apk add --no-cache wget ca-certificates && \
    wget -qO- "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
    | tar xzf - -C /usr/local/bin

WORKDIR /app
COPY . .
RUN zola build

FROM nginx:alpine

COPY --from=build /app/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --spider -q http://localhost/ || exit 1
