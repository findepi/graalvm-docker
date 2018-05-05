#!/usr/bin/env bash

set -veuo pipefail

cd "$(dirname "$0")/.."
source ./settings.sh

docker pull "${IMAGE_NAME}:${GRAAL_VERSION}" || true
docker pull "${IMAGE_NAME}:${GRAAL_VERSION}-polyglot" || true

docker build \
    --pull \
    --file Dockerfile \
    --build-arg "GRAAL_VERSION=${GRAAL_VERSION}" \
    --cache-from "${IMAGE_NAME}:${GRAAL_VERSION}" \
    --tag "${IMAGE_NAME}:${GRAAL_VERSION}" \
    --tag "${IMAGE_NAME}:latest" \
    --tag "local-graalvm:latest" \
    .

docker build \
    --pull \
    --file Dockerfile.polyglot \
    --build-arg "GRAAL_VERSION=${GRAAL_VERSION}" \
    --cache-from "${IMAGE_NAME}:${GRAAL_VERSION}-polyglot" \
    --tag "${IMAGE_NAME}:${GRAAL_VERSION}-polyglot" \
    --tag "${IMAGE_NAME}:latest-polyglot" \
    --tag "local-graalvm-polyglot:latest" \
    .
