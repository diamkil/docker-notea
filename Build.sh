#!/bin/bash
docker pull cinwell/notea:latest
docker pull minio/minio:latest

docker build . -t diamkil/notea:latest

echo "Would you like to push? (y/n)"
read -n 1 confirm
echo ""

if [ "$confirm" == "y" ];
then
    echo "Pushing"
    docker push diamkil/notea:latest
else
    echo "Not Pushing"
fi
