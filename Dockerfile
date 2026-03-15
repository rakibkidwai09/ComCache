FROM redis:7.2-alpine

COPY redis.conf /usr/local/etc/redis/redis.conf

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]

HEALTHCHECK --interval=30s --timeout=10s \
  CMD redis-cli ping || exit 1