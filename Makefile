
.PHONY: build-test
build-test:
	docker build -t igor/hello-world .

	# -t : giving name
	# . : current directory


.PHONY: run-test
run-test: build-test
	docker run -p 8099:80 --rm --name test igor/hello-world
