ARG PYTHON_MINOR=8
FROM python:3.${PYTHON_MINOR}-alpine

COPY requirements.txt /tmp/pip-tmp/

COPY requirements.txt /tmp/pip-tmp/
RUN apk add --no-cache libffi-dev gcc musl-dev make build-base && \
    pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt && \
    rm -rf /tmp/pip-tmp && \
    apk del libffi-dev gcc musl-dev make build-base
