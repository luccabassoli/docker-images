FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl unzip tar libncursesw5 && apt-get clean && rm -rf /var/lib/apt/lists/*

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD sh -c "$START"