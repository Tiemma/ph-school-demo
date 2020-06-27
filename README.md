# PH School Of AI DEMO - Containers

I'd be working on showcasing how to use Docker containers to speed up your workflow when testing and working with various ML tools.

Containers provide isolation and a sort of pre-created environment making it easy to go from new PC to full fledged dev environment in seconds

## How to start
All you need is the env.sh file

```bash
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
fi
```

Run this using a bash environment,
Windows users should download `cmder`, `cygwin` or [WSL](https://ubuntu.com/wsl)

```
bash env.sh
```


It'll start up a new container environment or continue from where you left off :-).
