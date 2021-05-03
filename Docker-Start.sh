#!/bin/sh

if [ -d "/data/notea" ]
then
    echo "Notea Bucket already exists, continuing" 
else
    echo "Notea Bucket doesn't exist, creating it"
    mkdir -p /data/notea
fi

echo "Starting MinIO"
screen -d -m ./MinIO-Start.sh

echo "Starting Notea"
./Notea-Start.sh