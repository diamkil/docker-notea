#!/bin/sh

mkdir -p /data/notea

screen -d -m ./MinIO-Start.sh

screen -d -m ./Notea-Start.sh

/bin/sh