# CompCache

CompCache is a simple dockerized caching service built on Redis.

## Run

docker compose up --build

## Test

docker exec -it compcache redis-cli

SET test "hello"
GET test