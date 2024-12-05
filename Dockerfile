FROM ubuntu:24.04

# package management
RUN apt-get update
RUN apt-get install -y openssh-server

# group management
## mahasiswa
RUN groupadd mhs
## dosen
RUN groupadd dsn

