.PHONY: python_37
python_37:
	docker build python/3.7 -t python:3.7-ayorgo

.PHONY: python_310
python_310:
	docker build python/3.10 -t python:3.10-ayorgo

.PHONY: python_311
python_311:
	docker build python/3.11 -t python:3.11-ayorgo

.PHONY: python_311_arch
python_311_arch:
	docker build python/3.11-arch -t python:3.11-arch-ayorgo

.PHONY: r_431
r_431:
	docker build r/4.3.1 -t r:4.3.1-ayorgo
