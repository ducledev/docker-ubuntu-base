ARG UBUNTU_VERSION

FROM ubuntu:${UBUNTU_VERSION}

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="UTC"
ARG PYTHON_VERSION
# ENV PYTHON_VERSION="3.12.0"

USER root

RUN set -ex && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install git -y && \
    apt-get install -y \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        libffi-dev \
        liblzma-dev \
        default-libmysqlclient-dev

RUN apt-get install -y build-essential curl git wget unzip

# set display port to avoid crash
ENV DISPLAY=:99
ENV HOME_PATH="/home/ubuntu"

ENV PYENV_ROOT="${HOME_PATH}/.pyenv"
#ENV PATH $PYENV_ROOT/bin:$PATH
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

RUN curl https://pyenv.run | bash && \
    eval "$(pyenv init --path)" && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> "${HOME_PATH}/.bashrc"

RUN pyenv install $PYTHON_VERSION
RUN pyenv global $PYTHON_VERSION

# update pip
RUN python -m pip install --upgrade pip
RUN python -m pip install wheel

# install pipenv
RUN pip install pipenv

RUN echo "End Dockerfile_base"
