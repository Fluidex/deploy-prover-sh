FROM ubuntu:20.04

COPY . .

RUN ./deploy.sh
