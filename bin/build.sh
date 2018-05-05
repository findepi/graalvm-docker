#!/usr/bin/env bash

set -veuo pipefail

cd "$(dirname "$0")/.."
source ./settings.sh

docker build \
    --file Dockerfile \
    --build-arg "GRAAL_VERSION=${GRAAL_VERSION}" \
    --tag "${IMAGE_NAME}:${GRAAL_VERSION}" \
    --tag "local-graalvm:latest" \
    .

docker build \
    --file Dockerfile.polyglot \
    --build-arg "GRAAL_VERSION=${GRAAL_VERSION}" \
    --tag "${IMAGE_NAME}:${GRAAL_VERSION}-polyglot" \
    --tag "local-graalvm-polyglot:latest" \
    .
