VERSION?=1.0
IMAGENAME?=dbrian/hello-go

release: clean build push

build:
	docker run \
	  -v "$(shell pwd):/src" \
	  -v /var/run/docker.sock:/var/run/docker.sock \
	  centurylink/golang-builder \
	  ${IMAGENAME}:${VERSION}

push:
	docker push ${IMAGENAME}:${VERSION}

clean:
	rm -f hello-go
	docker rm -f ${IMAGENAME}:${VERSION} 2> /dev/null || true
	docker rmi -f ${IMAGENAME}:${VERSION} 2> /dev/null || true

.PHONY: release clean build push
