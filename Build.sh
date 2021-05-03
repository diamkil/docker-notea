#!/bin/bash
time=$(date +%s)
docker pull cinwell/notea:latest
docker pull minio/minio:latest

docker build . -t diamkil/notea:latest -t diamkil/notea:$time

echo "Would you like to push? (y/n)"
read -n 1 confirm
echo ""

if [ "$confirm" == "y" ];
then
    echo "Pushing"
    docker push diamkil/notea:latest
    docker push diamkil/notea:$time
else
    echo "Not Pushing"
fi