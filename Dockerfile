FROM gliderlabs/alpine:3.3

RUN apk add --update \
    git \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

# Clone the original repo
RUN git clone https://github.com/timgrossmann/InstaPy.git /code
WORKDIR /code

# Install the requirements
ONBUILD RUN virtualenv /env && /env/bin/pip install -r /code/requirements.txt
