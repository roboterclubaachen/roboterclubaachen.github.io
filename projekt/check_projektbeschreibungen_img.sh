#!/bin/bash

set -e

for img in $(find assets/img/projektbeschreibungen/*)
do
    # Check image is exactly 1500x500px
    if [ "$(identify -format '%w %h' $img)" != "1500 500" ]
    then
        echo "Image $img has wrong size. Must be 1500x500px."
        file $img
        exit 1
    fi

    # Check image is <250kB
    if [ $(du -k "$img" | cut -f 1) -ge 250 ]
    then
        echo "Image $img is to large. Please compress, e.g. by lowering the JPEG quality setting to 85."
        du -h $img
        exit 1
    fi
done
