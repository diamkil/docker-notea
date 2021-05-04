#!/bin/bash
docker pull cinwell/notea:latest
docker pull minio/minio:latest

docker build . -t diamkil/notea:latest

docker push diamkil/notea:latest
