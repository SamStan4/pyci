FROM python:3.6.8

WORKDIR /app

COPY . .

RUN make build-pyci-env

CMD ["/bin/bash"]