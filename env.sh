#!/usr/bin/env bash

CONTAINER=$(basename $PWD)
echo "Docker Container Name: $CONTAINER" 

CONTAINER_EXISTS=$(docker ps -a | grep $CONTAINER)
if [[ -z $CONTAINER_EXISTS ]]
then
  echo "Creating new dev environment container: $CONTAINER"
  docker run --name="$CONTAINER" -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyter/datascience-notebook
else
  echo "Container exists: $CONTAINER_EXISTS"
  docker start $CONTAINER
  docker logs $CONTAINER
fi
