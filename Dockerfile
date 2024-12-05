FROM ubuntu:24.04

# package management
RUN apt-get update
RUN apt-get install -y openssh-server

