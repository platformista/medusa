#!/usr/bin/env bash

# platform tunnel:close -y

# platform tunnel:open -y

export PLATFORM_RELATIONSHIPS="$(platform tunnel:info --encode)"

echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq '.redis'

. .environment

echo $DATABASE_URL

REDIS_HOST=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.redis[0].host')
REDIS_PORT=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.redis[0].port')
export REDIS_URL="redis://${REDIS_HOST}:${REDIS_PORT}/redis"
echo $REDIS_URL

# npm install
# npm run build
# npm run seed
# npm run migrations

# NODE_ENV=production npm run serve
npm run develop