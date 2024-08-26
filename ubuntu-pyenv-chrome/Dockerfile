ARG UBUNTU_PYENV_IMAGE_TAG="20.04_3.9.11"
FROM ducledev/ubuntu-pyenv:${UBUNTU_PYENV_IMAGE_TAG}

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="UTC"

#bypass the installation of google-chrome-stable
# gg chrome driver refs:
#       https://googlechromelabs.github.io/chrome-for-testing/
#       https://chromedriver.chromium.org/downloads


# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

RUN echo "End Dockerfile"
