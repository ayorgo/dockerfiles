FROM nvidia/cuda:12.2.0-runtime-ubuntu20.04

# Export timezone for Ubuntu install
ENV TZ=Europe/London

# Place timezone data /etc/timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -qq install -y \
    xclip \
    software-properties-common \
    wget \
    tar \
    libssl-dev \
    openssl \
    build-essential \
    zlib1g-dev \
    libffi-dev

# Install python3.11
RUN wget https://www.python.org/ftp/python/3.11.4/Python-3.11.4.tgz && tar xzvf Python-3.11.4.tgz
WORKDIR /Python-3.11.4
RUN ./configure && make && make install

RUN useradd -ms /bin/bash ayorgo
USER ayorgo

RUN mkdir /home/ayorgo/code
WORKDIR /home/ayorgo/code

# Set up python virtual environment
RUN python3 -m venv /home/ayorgo/virtualenvs/venvironment
ENV VIRTUAL_ENV /home/ayorgo/virtualenvs/venvironment
ENV PATH /home/ayorgo/virtualenvs/venvironment/bin:$PATH

RUN python3 -m pip install pip==23.1.2
RUN pip install poetry==1.5.1

COPY --chown=ayorgo:ayorgo pyproject.toml /home/ayorgo/code/pyproject.toml
COPY --chown=ayorgo:ayorgo poetry.lock /home/ayorgo/code/poetry.lock

ENV HOME=/home/ayorgo
ENV PATH=/home/ayorgo/.local/bin:${PATH}
ENV PYTHONPATH=/home/ayorgo/code

# Poetry will use the above virtual environment without creating a new one
RUN poetry install --no-root

# Enable vim bindings in ipython
COPY --chown=ayorgo:ayorgo ipython_config.py /home/ayorgo/.ipython/profile_default/ipython_config.py
COPY --chown=ayorgo:ayorgo ipython_vim_bindings.py /home/ayorgo/.ipython/profile_default/startup/ipython_vim_bindings.py

# Keep the history
ENV IPYTHONDIR=/home/ayorgo/.ipython
ENV HISTFILE=/home/ayorgo/.bash_history

# Keep the terminal colored
ENV TERM xterm-256color
