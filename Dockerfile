ARG PYTHON_MINOR_VERSION=10
FROM python:3.${PYTHON_MINOR_VERSION}-alpine

RUN apk add --no-cache libffi-dev gcc musl-dev make build-base libstdc++

RUN pip --no-cache-dir install --upgrade cython pip

RUN pip --disable-pip-version-check --no-cache-dir install pandas

RUN apk del libffi-dev gcc musl-dev make build-base
