#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit
fi

docker run --rm -it \
-v $1:/home/build/aosp \
-v $2:/home/build/.ccache \
3mdeb/aosp-docker /bin/bash
