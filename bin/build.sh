#!/usr/bin/env bash

set -xeuo pipefail

docker pull "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}" || true
docker pull "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-native" || true
docker pull "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot" || true

docker build \
    --pull `#base is public, make sure to use the latest greatest` \
    --file Dockerfile \
    --build-arg "JDK_VERSION=${JDK_VERSION}" \
    --build-arg "GRAAL_JDK_VERSION=${GRAAL_JDK_VERSION}" \
    --cache-from "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}" \
    --tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}" \
    .

docker build \
    --file Dockerfile.native \
    --build-arg "GRAAL_VERSION=${GRAAL_VERSION}" \
    --build-arg "JDK_VERSION=${JDK_VERSION}" \
    --cache-from "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-native" \
    --tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-native" \
    .

docker build \
    --file Dockerfile.polyglot \
    --build-arg "GRAAL_VERSION=${GRAAL_VERSION}" \
    --build-arg "JDK_VERSION=${JDK_VERSION}" \
    --cache-from "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot" \
    --tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot" \
    .

docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}" "${IMAGE_NAME}:${JDK_VERSION}"
docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-native" "${IMAGE_NAME}:${JDK_VERSION}-native"
docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot" "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-all"
docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot" "${IMAGE_NAME}:${JDK_VERSION}-polyglot"
docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot" "${IMAGE_NAME}:${JDK_VERSION}-all"

if [ "${DEFAULT_IMAGE}" = "true" ]; then
    docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}" "${IMAGE_NAME}:latest"
    docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-native" "${IMAGE_NAME}:native"
    docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot" "${IMAGE_NAME}:polyglot"
    docker tag "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-all" "${IMAGE_NAME}:all"
fi
