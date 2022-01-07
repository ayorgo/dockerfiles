FROM python:3.10

RUN apt-get update && apt-get install -y \
vim \
zip \
xclip

# Install aws client v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
unzip -qqq awscliv2.zip && ./aws/install
ENV PATH=~/v2/current/bin/aws:$PATH
ENV AWS_DEFAULT_REGION=eu-west-1

RUN useradd -ms /bin/bash ayorgo
USER ayorgo

RUN mkdir /home/ayorgo/code
WORKDIR /home/ayorgo/code

# Set up python virtual environment
RUN python -m venv /home/ayorgo/virtualenvs/venvironment
ENV VIRTUAL_ENV /home/ayorgo/virtualenvs/venvironment
ENV PATH /home/ayorgo/virtualenvs/venvironment/bin:$PATH

RUN python -m pip install pip==21.3.1
RUN pip install poetry==1.1.11

COPY --chown=ayorgo:ayorgo pyproject.toml /home/ayorgo/code/pyproject.toml
COPY --chown=ayorgo:ayorgo poetry.lock /home/ayorgo/code/poetry.lock

ENV HOME=/home/ayorgo
ENV PATH=/home/ayorgo/.local/bin:${PATH}
ENV PYTHONPATH=/home/ayorgo/code

# Poetry will use the above virtual environment without creating a new one
RUN poetry install --no-root

# Enable vim bindings in ipython
RUN if pip show ipython -q; then ipython profile create && echo "c.TerminalInteractiveShell.editing_mode = 'vi'" >> /home/ayorgo/.ipython/profile_default/ipython_config.py; fi

# Enhance vim bindings in ipython
COPY ipython_vim_bindings.py /home/ayorgo/.ipython/profile_default/startup/ipython_vim_bindings.py

# Keep the terminal colored
ENV TERM xterm-256color
