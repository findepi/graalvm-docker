#!bash

export IMAGE_NAME=findepi/graalvm # by necessity, this is also set in derived images' FROM directive
export JDK_VERSION="${JDK_VERSION-java17}"
export DEFAULT_IMAGE="${DEFAULT_IMAGE-false}"

if [ "${JDK_VERSION}" = "java17" ]; then
    GRAAL_JDK_VERSION="17.0.8"
    BUILD_POLYGLOT=true
elif [ "${JDK_VERSION}" = "java20" ]; then
    GRAAL_JDK_VERSION="20.0.2"
    BUILD_POLYGLOT=true
elif [ "${JDK_VERSION}" = "java21" ]; then
    GRAAL_JDK_VERSION="21.0.1"
    BUILD_POLYGLOT=false
else
    echo "Unknown JDK_VERSION ${JDK_VERSION}" >&2
    exit 1
fi
export GRAAL_JDK_VERSION
export BUILD_POLYGLOT
