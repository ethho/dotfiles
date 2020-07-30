PYTHON ?= python3
PREF_SHELL ?= bash
GITREF=$(shell git rev-parse --short HEAD)
GITREF_FULL=$(shell git rev-parse HEAD)

####################################
# Docker image & dist
####################################

IMG_ORG ?= enho
IMG_NAME ?= dotfiles
IMG_TAG ?= test
IMG ?= "${IMG_ORG}/${IMG_NAME}:${IMG_TAG}"

####################################
# Sanity checks
####################################

PROGRAMS := git docker python singularity tox $(CC)
.PHONY: $(PROGRAMS)
.SILENT: $(PROGRAMS)

docker:
	docker info 1> /dev/null 2> /dev/null && \
	if [ ! $$? -eq 0 ]; then \
		echo "\n[ERROR] Could not communicate with docker daemon. You may need to run with sudo.\n"; \
		exit 1; \
	fi
python poetry singularity $(CC):
	$@ --help &> /dev/null; \
	if [ ! $$? -eq 0 ]; then \
		echo "[ERROR] $@ does not seem to be on your path. Please install $@"; \
		exit 1; \
	fi
tox:
	$@ -h &> /dev/null; \
	if [ ! $$? -eq 0 ]; then \
		echo "[ERROR] $@ does not seem to be on your path. Please pip install $@"; \
		exit 1; \
	fi
git:
	$@ -h &> /dev/null; \
	if [ ! $$? -eq 129 ]; then \
		echo "[ERROR] $@ does not seem to be on your path. Please install $@"; \
		exit 1; \
	fi

####################################
# Docker
####################################
.PHONY: image shell tests

image: Dockerfile | docker
	docker build -t $(IMG) -f $< .

tests: image | docker
	docker run --rm $(IMG) dotfiles/./install.sh

shell: image | docker
	docker run --rm -it $(IMG) bash

