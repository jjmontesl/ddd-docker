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

Test running `ddd -h` in the container with:

    docker run -it ddd:latest ddd -h

You can map your data and working directories:

    docker run -v ~/ddd/data:/root/data -v ~/ddd/local:/root/local -it ddd:latest /bin/bash

Test run the OSM generation pipeline inside the container (elevation is disabled, as
it requires DEM files for the target area):

    docker run -p 8085:8085 -v ~/git/ddd/data:/root/data -v ~/git/ddd/private:/root/local -it ddd:latest \
        /bin/bash -c 'DDD_GEO_ELEVATION_DUMMY=True ddd run /root/ddd/pipelines/osm/osm_build.py -o --cache-clear --cache-ro --no-textures -p ddd:osm:area:center=-8.406500,43.385922 -p ddd:osm:area:radius=150m -p ddd:osm:output:name=acoruna_hercules -p ddd:osm:datasource:path=/root/local/data/osm/ --export-meshes'




