# ddd - DDD123
# Library for simple scene modelling.
# Jose Juan Montes and Contributors 2020-2021

# DDD Dockerfile
# Builds a container that includes 'ddd' and dependencies.  

#BASE_DIR:=$(shell pwd)
#OSM_PBF_DIR:=$(BASE_DIR)/data

FILES_DIR ?= files
IMG_TAG ?= latest

DDD_REPOSITORY ?= https://github.com/jjmontesl/ddd


.PHONY: download-ddd-repo
download-ddd-repo:

	mkdir -p $(FILES_DIR)
	rm -rf $(FILES_DIR)/ddd || true
	cd $(FILES_DIR) && git clone $(DDD_REPOSITORY) ddd

.PHONY: build
build:

	mkdir -p logs
	mkdir -p build
	
	tar czf build/files.tgz $(FILES_DIR)
	docker build -t ddd:$(IMG_TAG) -f Dockerfile.ddd . 2>&1 | tee logs/docker-build-ddd.log

.PHONY: image
image:
	mkdir -p $(BUILD_DIR)
	docker save ddd:$(IMG_TAG) | gzip > $(BUILD_DIR)/ddd.dockerimage.gz
