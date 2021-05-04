#!/bin/bash

export MINIO_ROOT_USER=$STORE_USER
export MINIO_ROOT_PASSWORD=$STORE_PASSWORD

minio server /data