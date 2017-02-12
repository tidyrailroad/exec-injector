#!/bin/sh

apk update &&
    apk upgrade &&
    apk add libxslt docker &&
    xsltproc /opt/docker/exec.xslt.xml /opt/docker/exec.data.xml > /opt/docker/entrypoint.sh
