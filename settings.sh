#!bash

export IMAGE_NAME=findepi/graalvm # by necessity, this is also set in derived images' FROM directive
export GRAAL_VERSION="20.1.1"
export JDK_VERSION="${JDK_VERSION-java8}"
export DEFAULT="${DEFAULT-false}"
