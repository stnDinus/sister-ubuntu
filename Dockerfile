FROM ubuntu:24.04

RUN apt-get update
RUN apt-get install -y unminimize
RUN yes | unminimize
