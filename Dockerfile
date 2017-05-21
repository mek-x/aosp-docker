FROM ubuntu:15.04
MAINTAINER Piotr Król <piotr.krol@3mdeb.com>


# Update the package repository
RUN apt-get update && apt-get upgrade -y
# && apt-get install locales

# Configure locales
# noninteractive installation using debconf-set-selections does not seem
# to work due to a bug in Debian glibc:
# https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1598326
# RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#     echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
#     dpkg-reconfigure --frontend=noninteractive locales && \
#     update-locale LANG=en_US.UTF-8
# RUN locale-gen en_US.UTF-8
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update

# AOSP dependencies
RUN apt-get install -y \
    openjdk-7-jdk \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    python \
    clang

RUN useradd -ms /bin/bash build && \
    usermod -aG sudo build

USER build
WORKDIR /home/build

ENV USE_CCACHE 1
ENV CCACHE_DIR /home/build/.ccache
