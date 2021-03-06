
.PHONY: build-image
build-image:
	docker build -t igor/hello-world .

	# build : build docker image
	# -t : giving new name
	# . : current directory

.PHONY: run-test
run-test: build-image
	docker run -p 8099:80 --rm --name test igor/hello-world

	# run : create container layer
	# -p : add port
	# --rm : remove container after close
	# --name: add container name

.PHONY: push-image
push-image:
	docker tag igor/hello-world ipostnikov/hello-world
	docker push ipostnikov/hello-world

	# tag : tag image
	# push : push image to to hub.docker.com to ipostnikov/hello-world repo

.PHONY: run-hub-test
run-hub-test: build-imagegigit  push-image
	docker run -p 8098:80 --rm --name test-hub ipostnikov/hello-world

