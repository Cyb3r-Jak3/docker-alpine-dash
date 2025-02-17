ARG PYTHON_MINOR_VERSION=8
FROM python:3.${PYTHON_MINOR_VERSION}-alpine

RUN apk add --no-cache libffi-dev gcc musl-dev make build-base libstdc++

RUN pip --disable-pip-version-check --no-cache-dir install cython

COPY requirements.txt /tmp/pip-tmp/

RUN pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt && \
    rm -rf /tmp/pip-tmp

RUN apk del libffi-dev gcc musl-dev make build-base
