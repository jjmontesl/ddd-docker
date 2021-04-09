# DDD(123) Docker Image


## Introduction



## Building the image


## Test

docker run -v $DDD_DATADIR:/root/data -v $DDD_LOCAL:/root/local -it ddd:latest /bin/bash
docker run -v ~/git/ddd/data:/root/data -v ~/git/ddd/private:/root/local -it ddd:latest /bin/bash

ddd osm-build --center=-8.406500,43.385922 --radius 200 --name=acoruna_hercules --catalog-overwrite --export-meshes --export-textures



## Running from DDD source

How to run DDD from custom source in the host (for DDD development)
