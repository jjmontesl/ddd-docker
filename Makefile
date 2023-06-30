# ddd - DDD123
# Library for simple scene modelling.
# Jose Juan Montes and Contributors 2020-2021

# DDD Dockerfile
# Builds a container that includes 'ddd' and dependencies.  

#BASE_DIR:=$(shell pwd)
#OSM_PBF_DIR:=$(BASE_DIR)/data

FILES_DIR ?= files
IMG_TAG ?= latest

#DDD_REPOSITORY ?= https://github.com/jjmontesl/ddd
DDD_REPOSITORY ?= ~/git/ddd
#DDD_BRANCH ?= master
DDD_BRANCH ?= jjmontes/devel

#DOCKER_BUILD_OPTIONS ?= "--no-cache"  # "--no-cache"
DOCKER_BUILD_OPTIONS = 

.PHONY: download-ddd-repo
download-ddd-repo:

	mkdir -p $(FILES_DIR)
	rm -rf $(FILES_DIR)/ddd || true
	cd $(FILES_DIR) && git clone  --depth 1 $(DDD_REPOSITORY) ddd -b $(DDD_BRANCH)																																																																																																																																																										

.PHONY: build
build:

	#mkdir -p logs
	#mkdir -p build
	
	#tar czf build/files.tgz $(FILES_DIR)
	
	# NOTE: no-cache is often needed
	# FIXME: seems that make does not fail if the build fails (due to the tee?) 
	# 2>&1 # | tee logs/docker-build-ddd.log
	docker build $(DOCKER_BUILD_OPTIONS) -t ddd:$(IMG_TAG) -f Dockerfile.ddd .  

# .PHONY: build-ubuntu22
# build:

# 	#tar czf build/files.tgz $(FILES_DIR)
	
# 	# NOTE: no-cache is often needed
# 	# FIXME: seems that make does not fail if the build fails (due to the tee?) 
# 	# 2>&1 # | tee logs/docker-build-ddd.log
# 	docker build $(DOCKER_BUILD_OPTIONS) -t ddd:$(IMG_TAG) -f Dockerfile.ddd-ubuntu22 .  

	

.PHONY: image
image:
	mkdir -p $(BUILD_DIR)
	docker save ddd:$(IMG_TAG) | gzip > $(BUILD_DIR)/ddd.dockerimage.gz
