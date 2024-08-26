#!/bin/bash

# sample command
# source ./ubuntu_20.04/2004_3911.env && ./build_base_image.sh

if [ -z "${UBUNTU_VERSION}" ]; then
    echo "Please use .env file to get UBUNTU_VERSION variable"
    exit
fi
if [ -z "${PYTHON_VERSION}" ]; then
    echo "Please use .env file to get PYTHON_VERSION variable"
    exit
fi
    

# source ./.env
echo "Ubuntu version: \`${UBUNTU_VERSION}\`, Python version: \`${PYTHON_VERSION}\`"

IMAGE_TAG="${UBUNTU_VERSION}_${PYTHON_VERSION}"
IMAGE_NAME="ducledev/ubuntu-pyenv:${IMAGE_TAG}"

echo "-- Build docker image \`${IMAGE_NAME}\`"

docker buildx build -f Dockerfile -t $IMAGE_NAME \
--platform linux/amd64 --no-cache \
--build-arg UBUNTU_VERSION=${UBUNTU_VERSION} \
--build-arg PYTHON_VERSION=${PYTHON_VERSION}  .

echo "-- End building docker image: \`${IMAGE_NAME}\`"
docker image ls | grep -iE "REPOSITORY|${IMAGE_TAG}"