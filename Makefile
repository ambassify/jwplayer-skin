#
# BUILD BOOTSWATCH SWATCH
#

SOURCE_PATH=src
DIST_PATH=dist
SKIN_NAME=bubobox

# Deploy configuration
DEPLOY_BUCKET=bubobox.static
DEPLOY_PATH="player/jw/skins"

DATE=$(shell date +%I:%M%p)
ROOT=$(shell pwd)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

clean:
	@echo "${CHECK} Clean project"
	@rm -rf ${DIST_PATH}/*

build:
	@make clean
	@echo "${CHECK} Build skins"
	@./skin-builder.py ${SKIN_NAME}

deploy:
	@echo "${CHECK} Deploy to S3"
	@s3cmd put --acl-public ${DIST_PATH}/${SKIN_NAME}.xml s3://${DEPLOY_BUCKET}/${DEPLOY_PATH}/${SKIN_NAME}.xml

all: build deploy

.PHONY: clean build deploy all

