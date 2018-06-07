#!/usr/bin/env bash

set -veuo pipefail

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push "${IMAGE_NAME}:latest"
docker push "${IMAGE_NAME}:native"
docker push "${IMAGE_NAME}:polyglot"
docker push "${IMAGE_NAME}:all"
docker push "${IMAGE_NAME}:${GRAAL_VERSION}"
docker push "${IMAGE_NAME}:${GRAAL_VERSION}-native"
docker push "${IMAGE_NAME}:${GRAAL_VERSION}-polyglot"
docker push "${IMAGE_NAME}:${GRAAL_VERSION}-all"
