# DDD(123) Docker Image


## Introduction

This repository contains a Dockerfile build file that includes several
dependencies needed to run DDD and in particular, the DDD-OSM 3D generation
pipeline (this is the image used by 3dsmaps.com).

Note that this image does NOT include textures, terrain elevation models,
population database or OpenStreetMap datasets.


## Building the image

Run:

    make download-ddd-repo
    make build

## Running

Use:

    docker run -v $DDD_DATADIR:/root/data -v $DDD_LOCAL:/root/local -it ddd:latest /bin/bash

Eg:

    docker run -v ~/git/ddd/data:/root/data -v ~/git/ddd/private:/root/local -it ddd:latest /bin/bash

You can then run DDD command inside the container:

    ddd osm-build --center=-8.406500,43.385922 --radius 200 --name=acoruna_hercules --catalog-overwrite --export-meshes --export-textures



