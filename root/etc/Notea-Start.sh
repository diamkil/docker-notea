#!/bin/bash

export STORE_ACCESS_KEY=$STORE_USER
export STORE_SECRET_KEY=$STORE_PASSWORD
export STORE_BUCKET=notea
export STORE_END_POINT=$STORE_URL
export STORE_FORCE_PATH_STYLE=true
export COOKIE_SECURE=false

/notea/node_modules/.bin/next start