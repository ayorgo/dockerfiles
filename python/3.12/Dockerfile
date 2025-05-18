FROM python:3.12.10-slim

ARG USER=ayorgo

# Install system dependencies.
RUN apt-get update && apt-get -qq install -y --no-install-recommends \
    jq \
    curl \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash $USER -g users
USER $USER

ENV HOME=/home/$USER
RUN mkdir $HOME/code
WORKDIR $HOME/code

# Set up python virtual environment
ENV VIRTUAL_ENV=$HOME/virtualenvs/venvironment
RUN python -m venv $VIRTUAL_ENV
ENV PATH=$VIRTUAL_ENV/bin:$PATH

# Install pip and poetry
RUN python -m pip install --no-cache-dir pip==25.0.1 && \
    pip install --no-cache-dir poetry==2.1.2

# Set up paths
ENV PATH=$HOME/.local/bin:$PATH
ENV PYTHONPATH=$HOME/code/src:$PYTHONPATH

# Install packages with poetry
# Poetry will use the above virtual environment without creating a new one
COPY --chown=$USER:$USER . $HOME/code/
RUN poetry install --no-root --no-cache

# Enable vim bindings in ipython
COPY --chown=$USER:$USER ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
COPY --chown=$USER:$USER ipython_vim_bindings.py $HOME/.ipython/profile_default/startup/ipython_vim_bindings.py

# Keep the history
ENV IPYTHONDIR=$HOME/.ipython
ENV HISTFILE=$HOME/.bash_history
