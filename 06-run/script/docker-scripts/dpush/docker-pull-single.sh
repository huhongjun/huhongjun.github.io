#!/usr/bin/env bash

#
#   usage:  dpull <image-server> <image-name>
#
#   sample: dpull docker.lan alpine
#

iserver=$1      # "192.168.1.172:9005"
image=$2        #  alpine

_IPULL="docker pull"
_ITAG="docker tag"
_UTAG="docker image rm"

if [ -z $image ]; then

    echo "dpull -> image name cannot be null. ==> usage:  dpull <image-server> <image-name>"

else
    echo "dpull -> pull ${image} from ${iserver}, then tag it"
    echo "dpull -> $_IPULL $iserver/$image"
    $_IPULL $iserver/$image
    if [ $? -eq 0 ]; then
        echo " dpull -> $_ITAG $iserver/$image $image"
        $_ITAG $iserver/$image $image
        $_UTAG $iserver/$image
        if [ $? -eq 0 ]; then
            echo 'dpull -> END: pull and tag finished. '
        fi
    fi
fi