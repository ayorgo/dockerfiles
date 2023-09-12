FROM python:3.11

RUN apt-get update && apt-get -qq install -y \
    vim \
    zip \
    xclip \
    graphviz \
    software-properties-common \
    npm \
    r-base \
    r-base-dev

# Install aws client v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
    unzip -qqq awscliv2.zip && ./aws/install
ENV PATH=~/v2/current/bin/aws:$PATH
ENV AWS_DEFAULT_REGION=eu-west-1

# Install nodejs
RUN npm install --quiet npm@8.3.0 -g && \
npm install --quiet n -g && \
n 16.13.2

RUN useradd -ms /bin/bash ayorgo

# Install R packages
RUN chown -R ayorgo:ayorgo /usr/local/lib/R/site-library

USER ayorgo

RUN mkdir /home/ayorgo/code
WORKDIR /home/ayorgo/code

# Install kubectl
RUN curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mkdir -p /home/ayorgo/bin && \
    cp ./kubectl /home/ayorgo/bin/kubectl
ENV PATH=$PATH:/home/ayorgo/bin

# Set up python virtual environment
RUN python -m venv /home/ayorgo/virtualenvs/venvironment
ENV VIRTUAL_ENV /home/ayorgo/virtualenvs/venvironment
ENV PATH /home/ayorgo/virtualenvs/venvironment/bin:$PATH

RUN python -m pip install pip==23.1.2
RUN pip install poetry==1.5.1

COPY --chown=ayorgo:ayorgo pyproject.toml /home/ayorgo/code/pyproject.toml
COPY --chown=ayorgo:ayorgo poetry.lock /home/ayorgo/code/poetry.lock

ENV HOME=/home/ayorgo
ENV PATH=/home/ayorgo/.local/bin:${PATH}
ENV PYTHONPATH=/home/ayorgo/code

# Poetry will use the above virtual environment without creating a new one
RUN poetry install --no-root

# Install R packages
RUN R -e "install.packages('IRkernel')"
RUN R -e "IRkernel::installspec()"

# Enable vim bindings in ipython
COPY --chown=ayorgo:ayorgo ipython_config.py /home/ayorgo/.ipython/profile_default/ipython_config.py
COPY --chown=ayorgo:ayorgo ipython_vim_bindings.py /home/ayorgo/.ipython/profile_default/startup/ipython_vim_bindings.py

# Keep the history
ENV IPYTHONDIR=/home/ayorgo/.ipython
ENV HISTFILE=/home/ayorgo/.bash_history

# Keep the terminal colored
ENV TERM xterm-256color
