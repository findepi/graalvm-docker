#!/usr/bin/env bash

set -xeuo pipefail

docker pull "${IMAGE_NAME}:${JDK_VERSION}" || true
docker pull "${IMAGE_NAME}:${JDK_VERSION}-native" || true
if "${BUILD_POLYGLOT}"; then
    docker pull "${IMAGE_NAME}:${JDK_VERSION}-polyglot" || true
fi

docker build \
    --pull `#base is public, make sure to use the latest greatest` \
    --file Dockerfile \
    --build-arg "JDK_VERSION=${JDK_VERSION}" \
    --build-arg "GRAAL_JDK_VERSION=${GRAAL_JDK_VERSION}" \
    --cache-from "${IMAGE_NAME}:${JDK_VERSION}" \
    --tag "${IMAGE_NAME}:${JDK_VERSION}" \
    .

docker build \
    --file Dockerfile.native \
    --build-arg "JDK_VERSION=${JDK_VERSION}" \
    --cache-from "${IMAGE_NAME}:${JDK_VERSION}-native" \
    --tag "${IMAGE_NAME}:${JDK_VERSION}-native" \
    .

# Polyglot image depends on `gu` which is removed from Java21. While it's possible
# to provide equivalent functionality (e.g. `pyenv install graalpy-community-23.1.0`
# for Python), it not necessarily makes sense (bigger image). For now, don't build
# polyglot.
if "${BUILD_POLYGLOT}"; then
    docker build \
        --file Dockerfile.polyglot \
        --build-arg "JDK_VERSION=${JDK_VERSION}" \
        --cache-from "${IMAGE_NAME}:${JDK_VERSION}-polyglot" \
        --tag "${IMAGE_NAME}:${JDK_VERSION}-polyglot" \
        .
fi

docker tag "${IMAGE_NAME}:${JDK_VERSION}" "${IMAGE_NAME}:${JDK_VERSION}"
docker tag "${IMAGE_NAME}:${JDK_VERSION}-native" "${IMAGE_NAME}:${JDK_VERSION}-native"
if "${BUILD_POLYGLOT}"; then
    docker tag "${IMAGE_NAME}:${JDK_VERSION}-polyglot" "${IMAGE_NAME}:${JDK_VERSION}-polyglot"
    # When there is no polyglot image, the "all" image does not make much sense.
    docker tag "${IMAGE_NAME}:${JDK_VERSION}-polyglot" "${IMAGE_NAME}:${JDK_VERSION}-all"
fi

if [ "${DEFAULT_IMAGE}" = "true" ]; then
    docker tag "${IMAGE_NAME}:${JDK_VERSION}" "${IMAGE_NAME}:latest"
    docker tag "${IMAGE_NAME}:${JDK_VERSION}-native" "${IMAGE_NAME}:native"
    if "${BUILD_POLYGLOT}"; then
        docker tag "${IMAGE_NAME}:${JDK_VERSION}-polyglot" "${IMAGE_NAME}:polyglot"
        # When there is no polyglot image, the "all" image does not make much sense.
        docker tag "${IMAGE_NAME}:${JDK_VERSION}-all" "${IMAGE_NAME}:all"
    fi
fi
