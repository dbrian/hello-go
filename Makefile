.PHONY: all

GIT_BRANCH?=$(shell git rev-parse --abbrev-ref HEAD 2>/dev/null)
TRAVIS_BUILD_NUMBER?=${USER}-${GIT_BRANCH}
VERSION?=1.0.${TRAVIS_BUILD_NUMBER}
APPNAME?=dbrian/hello-go

release: clean build docker-build

clean:
	rm -rf dist
	docker rm -f ${APPNAME}:${VERSION} 2> /dev/null || true
	docker rmi -f ${APPNAME}:${VERSION} 2> /dev/null || true
	docker rm -f ${APPNAME} 2> /dev/null || true
	docker rmi -f ${APPNAME} 2> /dev/null || true

build:
	docker run -v "$(shell pwd):/src" centurylink/golang-builder
	mkdir -p dist
	mv hello-go dist/

docker-build:
	docker build -t ${APPNAME} -t ${APPNAME}:${VERSION} .
