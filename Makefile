VERSION := 'na'
ARCH := 'na'

.DEFAULT_GOAL := build

DIR := ${CURDIR}

build:
	docker build -t batch-builder .

test: build
test:
	mkdir -p tmp
	zip -r tmp/test.zip tests
	docker network create batch-builder-test-net  || true
	docker container stop batch-builder-nginx || true
	docker container rm batch-builder-nginx || true
	# echo "$(shell pwd)"
	docker run --name batch-builder-nginx -v $(shell pwd)/tmp:/usr/share/nginx/html:ro -p 8080:80 -d --net batch-builder-test-net nginx
	docker run -e SOURCE_BUNDLE="http://batch-builder-nginx/test.zip" -e ENTRYPOINT="tests/entrypoint.sh" --net batch-builder-test-net batch-builder
	docker container stop batch-builder-nginx || true
	docker network rm batch-builder-test-net || true
