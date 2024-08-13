FROM rust:1.80.0-slim-bookworm

RUN apt-get update && apt-get -qq install -y \
    vim

RUN rustup component add rustfmt rust-docs

RUN useradd -ms /bin/bash ayorgo
USER ayorgo

RUN mkdir /home/ayorgo/code
WORKDIR /home/ayorgo/code

# Keep the terminal colored
ENV TERM xterm-256color
