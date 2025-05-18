.PHONY: python_37
python_37:
	docker build python/3.7 -t python:3.7-ayorgo

.PHONY: python_310
python_310:
	docker build python/3.10 -t python:3.10-ayorgo

.PHONY: python_310_pytorch_cuda
python_310_pytorch_cuda:
	docker build python/3.10-pytorch-cuda -t python:3.10-pytorch-cuda-ayorgo

.PHONY: python_311
python_311:
	docker build python/3.11 -t python:3.11-ayorgo

.PHONY: python_311_arch
python_311_arch:
	docker build python/3.11-arch -t python:3.11-arch-ayorgo

.PHONY: python_311_cuda
python_311_cuda:
	docker build python/3.11-cuda -t python:3.11-cuda-ayorgo

.PHONY: python_312
python_312:
	docker build python/3.12 -t python:3.12-ayorgo

.PHONY: r_431
r_431:
	docker build r/4.3.1 -t r:4.3.1-ayorgo

.PHONY: rust_1800
rust_1800:
	docker build rust/1.80.0 -t rust:1.80.0-ayorgo
