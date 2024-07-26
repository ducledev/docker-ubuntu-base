#!/bin/bash

echo '-- Build docker image'

docker buildx build --platform linux/amd64 --no-cache -f Dockerfile -t ducledev/ubuntu-pyenv:20.04_3.9.11 .

echo '-- End building docker image'