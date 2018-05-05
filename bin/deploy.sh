#!/usr/bin/env bash

set -veuo pipefail

cd "$(dirname "$0")/.."
source ./settings.sh

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push "${IMAGE_NAME}:latest"
docker push "${IMAGE_NAME}:polyglot"
docker push "${IMAGE_NAME}:${GRAAL_VERSION}"
docker push "${IMAGE_NAME}:${GRAAL_VERSION}-polyglot"
