#!/bin/bash

# sample command
# source ./20.04_3.9.11/.env && ./build_base_chrome_image.sh
#source .env

echo '-- Build docker image'
echo "IMAGE_TAG: ${IMAGE_TAG}"
echo "UBUNTU_PYENV_IMAGE_TAG: ${UBUNTU_PYENV_IMAGE_TAG}"

if [ -z "${IMAGE_TAG}" ]; then
    echo "Please use .env file to get IMAGE_TAG variable"
    exit
fi

if [ -z "${UBUNTU_PYENV_IMAGE_TAG}" ]; then
    echo "Please use .env file to get UBUNTU_PYENV_IMAGE_TAG variable"
    exit
fi

IMAGE_NAME="ducledev/ubuntu-pyenv-chrome:${IMAGE_TAG}"

docker buildx build --platform linux/amd64 --no-cache -f Dockerfile \
-t ${IMAGE_NAME} \
--build-arg UBUNTU_PYENV_IMAGE_TAG="${UBUNTU_PYENV_IMAGE_TAG}"  .

echo "-- End building docker image: ${IMAGE_NAME}"

docker image ls | grep -iE "REPOSITORY|${IMAGE_TAG}"