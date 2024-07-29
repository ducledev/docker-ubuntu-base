#!/bin/bash

# sample command
# source ./20.04_3.9.11/.env && ./build_base_chrome_image.sh

echo '-- Build docker image'

if [ -z "${IMAGE_TAG}" ]; then
    echo "Please use .env file to get IMAGE_TAG variable"
    exit
fi

IMAGE_NAME="ducledev/ubuntu-pyenv-chrome:${IMAGE_TAG}"

docker buildx build --platform linux/amd64 --no-cache -f Dockerfile \
-t ${IMAGE_NAME} \
--build-arg IMAGE_TAG=${IMAGE_TAG}  .

echo '-- End building docker image: ${IMAGE_NAME}'