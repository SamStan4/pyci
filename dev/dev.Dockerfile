FROM python:3.6.8

WORKDIR /app

COPY . .

RUN python3 --version

CMD ["/bin/bash"]