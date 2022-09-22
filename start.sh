#!/bin/bash

container=$(docker ps -f name=ms-vscode-server -q)
if [ ! -z "$container" ]; then
    docker container kill ms-vscode-server > /dev/null
    docker container rm ms-vscode-server > /dev/null
fi

## Start docker container
docker run -d --expose=80 --name ms-vscode-server therenanlira/ms-vscode-server:latest