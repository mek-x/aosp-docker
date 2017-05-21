#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit
fi

docker run --rm -it \
-v $1:/home/build/aosp \
-v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK  \
-v ~/.gitconfig:/home/build/.gitconfig \
3mdeb/aosp-docker /bin/bash
