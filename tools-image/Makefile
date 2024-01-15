VERSION ?= $(git describe --abbrev=0 --tags)
CI_BUILD_REF ?= $(shell git rev-parse --verify HEAD)
PROJECT_NAME = tools
PYFILES = tools
DOCKER_ID_USER = dbandin
CONTAINER_NAME = ${DOCKER_ID_USER}/${PROJECT_NAME}

dk-build:
	docker build \
		-t  ${CONTAINER_NAME}:${CI_BUILD_REF} \
		-t  ${CONTAINER_NAME}:latest \
		--build-arg "commit=${CI_BUILD_REF}" \
		.

dk-publish:
	docker push ${CONTAINER_NAME}:latest

dk-run: 
	docker run -it \
	${CONTAINER_NAME}:latest

