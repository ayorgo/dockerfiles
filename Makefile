.PHONY: build_37
build_37:
	docker build 3.7 -t python:3.7-ayorgo

.PHONY: build_310
build_310:
	docker build 3.10 -t python:3.10-ayorgo

.PHONY: build_311
build_311:
	docker build 3.11 -t python:3.11-ayorgo
