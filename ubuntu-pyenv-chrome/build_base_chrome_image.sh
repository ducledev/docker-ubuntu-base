#!/bin/bash

# sample command
# ./build_base_chrome_image.sh

source .env
IMAGE_NAME="ducledev/ubuntu-pyenv-chrome:${IMAGE_TAG}"

echo "IMAGE_TAG: ${IMAGE_TAG}"
echo "UBUNTU_PYENV_IMAGE_TAG: ${UBUNTU_PYENV_IMAGE_TAG}"

echo "-- Build docker image IMAGE_NAME=${IMAGE_NAME}"

if [ -z "${IMAGE_TAG}" ]; then
    echo "Please use .env file to get IMAGE_TAG variable"
    exit
fi

if [ -z "${UBUNTU_PYENV_IMAGE_TAG}" ]; then
    echo "Please use .env file to get UBUNTU_PYENV_IMAGE_TAG variable"
    exit
fi

# If you're using docker buildx build, 
# by default it doesn't automatically load the image into your local Docker daemon.
# You need to add the --load flag

docker buildx build -f Dockerfile -t ${IMAGE_NAME} \
--push \
--load \
--platform linux/amd64 --no-cache \
--build-arg UBUNTU_PYENV_IMAGE_TAG=${UBUNTU_PYENV_IMAGE_TAG}  .


echo "-- End building docker image: ${IMAGE_NAME}"

docker image ls | grep -iE "REPOSITORY|${IMAGE_TAG}"