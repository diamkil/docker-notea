#!/bin/bash

cd /home/felix/docker-notea
rm -rf last-build.txt
./Build.sh | tee last-build.txt
/root/discord.sh --webhook-url="$WEBHOOK" --file last-build.txt
