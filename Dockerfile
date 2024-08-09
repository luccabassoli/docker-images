FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl unzip tar libncursesw5 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /home/container

CMD sh -c "$START"