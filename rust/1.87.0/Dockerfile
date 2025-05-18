FROM rust:1.87.0-slim-bullseye

ARG USER=ayorgo

RUN apt-get update && apt-get -qq install -y

RUN rustup component add rustfmt rust-src

RUN cargo install --locked evcxr_repl

RUN useradd -ms /bin/bash $USER
USER $USER

ENV HOME=/home/$USER
RUN mkdir $HOME/code
WORKDIR $HOME/code
