.PHONY: build_37
build_37:
	docker build 3.7 -t python:3.7-ayorgo

.PHONY: build_310
build_310:
	docker build 3.10 -t python:3.10-ayorgo
