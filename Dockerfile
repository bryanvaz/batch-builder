FROM debian:buster

LABEL author="Bryan Vaz"
LABEL version="0.1"

ENV AWS_VERSION 1.17.2

# Install C++ Build Deps
RUN apt-get update &&\
    apt-get install -y \
      sudo \
      time \
      git-core \
      subversion \
      build-essential \
      g++ \
      bash \
      make \
      libssl-dev \
      patch \
      libncurses5 \
      libncurses5-dev \
      zlib1g-dev \
      gawk \
      flex \
      gettext \
      wget \
      unzip \
      xz-utils \
      python \
      python-distutils-extra \
      python-pip \
      python3 \
      python3-distutils-extra \
      python3-pip \
      rsync \
      curl \
      bc \
      && \
    apt-get -y clean && \
    apt-get -y autoclean && \ 
    apt-get -y autoremove && \
    useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

# Install AWS CLI
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      groff \
      jq \
      && \
    apt-get -y clean && \
    apt-get -y autoclean && \ 
    apt-get -y autoremove && \
    pip3 install awscli==${AWS_VERSION} --upgrade --user

################################################
# Change non-root User
# From https://github.com/docker-library/python/blob/master/3.6/jessie/Dockerfile
################################################
USER user
WORKDIR /home/user

# set dummy git config
RUN git config --global user.name "user" && \ 
    git config --global user.email "user@example.com"

USER root
RUN mkdir -p /home/user/ && \
    mkdir /app
ADD bootstrap.sh /home/user/
RUN chown -R user:user /home/user && \
    chown -R user:user /app

USER user
CMD ["/home/user/bootstrap.sh"]
